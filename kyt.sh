#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY�;�x  ��� }���oޮ����    P����u��� J �"di�L��P��@䌀i��jiO4���~�ښ�0�� 22L���$!4<���� Ѧ�#� @�FF��C��i�@#&@0�`HF��?S�4I�h@�4��z#A�C�Oc��g|�F)`���,4����P��l$Ga)�i�ܨ��B��bS���K���ՈC�
H}�9�E�GzR�	|l[$�ͪTW��Tw!�D�����R��T�f"�$�Cz��Е��D�H��D���£ J�>{���O9��D�k�*"[��M��tɖ�Ϫ�E�&'j&���Y�9l���N�#�N�d=5�v:�H��AՐ|�.��[ *, {5
�q�{��Ul@PY�>chI,����`�H9_T���NF�O�B��ΤŒ���<��h�I��	'r9�ǭ����Q�MEtN�
�y�F.N܈t��Ī�i� ˲P��at�UTQ���H���/��+�Ɓi�p�&s�^r3ʥ:�:�DEѤ o�7M�Ï��}FHk��Pb�
R��C�Y^4 L���j0�G�!���4���x�-㬛�X��#�KO�Ks�S|`'Fm9�.���m�#����OP^��`Ì�M��u
�k�`�2�bE�e}�3bp��$��Y��x�3�X��'��o;	�~Q=�����dskWzΝ(�-��q��p{b�S��FP�4�5r���j�С7���U�h��DtdVP�i;�̶ih�S	!�D�{�����RPUPULE�Ԡ�B�U���J%t��dS�2�c�z7;�Ɋ�B�!tO��"2�Tdm⹈�"}����C��������)�Y$Y!�qyCN�+/猜��d�i���)qk;�GI!�3�Xfc�L�J�R-���:�['��^H��6�8��ٞ��K�����#�m��C2<�+�y�-�Z��$��I.$����.�p�!jw��