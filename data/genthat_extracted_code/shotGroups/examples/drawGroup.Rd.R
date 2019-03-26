library(shotGroups)


### Name: drawGroup
### Title: Draw a group of bullet holes with additional measures
### Aliases: drawGroup drawGroup.data.frame drawGroup.default

### ** Examples

# draw group in MOA
dg <- drawGroup(DFcciHV, xyTopLeft=TRUE, bb=TRUE, minCirc=TRUE,
                confEll=TRUE, maxSpread=TRUE, caliber=5.56, unit='MOA',
                dstTarget=100, conversion='yd2in', target='BDS9')

# mininum enclosing circle in MOA
dg$minCirc

# show Grubbs-Patnaik CEP estimator for mulitple levels
drawGroup(DF300BLKhl, CEP="GrubbsPatnaik", level=c(0.5, 0.9, 0.95),
          dstTarget=100, conversion="yd2in", caliber=7.62)



