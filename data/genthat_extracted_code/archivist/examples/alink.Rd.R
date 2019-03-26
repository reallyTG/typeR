library(archivist)


### Name: alink
### Title: Return a Link To Download an Artifact Stored on Remote
###   Repository
### Aliases: alink

### ** Examples

## Not run: 
##D # link in markdown format
##D alink('pbiecek/archivist/134ecbbe2a8814d98f0c2758000c408e')
##D # link in markdown format with additional subdir
##D alink(user='BetaAndBit',repo='PieczaraPietraszki',
##D      md5hash = '1569cc44e8450439ac52c11ccac35138', 
##D      subdir = 'UniwersytetDzieci/arepo')
##D # link in latex format
##D alink(user = 'MarcinKosinski', repo = 'Museum',
##D       md5hash = '1651caa499a2b07a3bdad3896a2fc717', format = 'latex')
##D # link in raw format
##D alink('pbiecek/graphGallery/f5185c458bff721f0faa8e1332f01e0f', rawLink = TRUE)  
##D alink('pbiecek/graphgallerygit/02af4f99e440324b9e329faa293a9394', repoType='bitbucket')  
## End(Not run)




