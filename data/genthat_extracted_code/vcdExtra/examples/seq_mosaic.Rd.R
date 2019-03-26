library(vcdExtra)


### Name: seq_mosaic
### Title: Sequential Mosaics and Strucplots for an N-way Table
### Aliases: seq_mosaic
### Keywords: hplots ~kwd2

### ** Examples


data(Titanic, package="datasets")

seq_mosaic(Titanic)  # models of joint independence, Survived last
seq_mosaic(Titanic, type="condit")
seq_mosaic(Titanic, type="mutual")

# other panel functions and options: presently BUGGED
## Not run: 
##D seq_mosaic(Titanic, type="mutual", panel=sieve, 
##D    gp=shading_Friendly, labeling=labeling_values)
## End(Not run)




