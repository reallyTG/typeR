library(poppr)


### Name: bootgen2genind
### Title: Switch between genind and genclone objects.
### Aliases: bootgen2genind bootgen2genind,bootgen-method as.genclone
###   as.genclone,genind-method genclone2genind
###   genclone2genind,genclone-method as.genambig as.genambig,genind-method

### ** Examples

data(Aeut)
Aeut

# Conversion to genclone --------------------------------------------------
Aeut.gc <- as.genclone(Aeut)
Aeut.gc

# Conversion to genind ----------------------------------------------------
Aeut.gi <- genclone2genind(Aeut.gc)
Aeut.gi

# Conversion to polysat's "genambig" class --------------------------------
if (require("polysat")) {
  data(Pinf)
  Pinf.gb <- as.genambig(Pinf)
  summary(Pinf.gb)
}

data(nancycats)

# Conversion to bootgen for random sampling of loci -----------------------
nan.bg  <- new("bootgen", nancycats[pop = 9])
nan.bg

# Conversion back to genind -----------------------------------------------
nan.gid <- bootgen2genind(nan.bg)
nan.gid




