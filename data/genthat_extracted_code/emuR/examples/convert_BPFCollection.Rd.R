library(emuR)


### Name: convert_BPFCollection
### Title: Convert a Bas Partitur File Collection (audio and BAS Partitur
###   files) to an emuDB
### Aliases: convert_BPFCollection

### ** Examples

## Not run: 
##D 
##D ##################################
##D # prerequisite: a dir with equally named file pairs *.wav and *.par
##D # (see ?create_emuRdemoData on how to create a demo)
##D 
##D # convert file pairs *.wav and *.par in /tmp/BPF_collection into emuRDB 'NewEmuR' in 
##D # dir /tmp/DirNewEmuR; the tier 'ORT' acts as the (word) reference tier; the 
##D # tier 'KAN' is one-to-one bound to 'ORT' as a label
##D convert_BPFCollection("/tmp/BPF_collection","/tmp/DirNewEmuR",'NewEmuR',
##D         bpfExt='par',audioExt='wav',refLevel='ORT',unifyLevels=c('KAN'))
##D 
## End(Not run)




