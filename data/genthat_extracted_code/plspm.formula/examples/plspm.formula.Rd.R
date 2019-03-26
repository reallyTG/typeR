library(plspm.formula)


### Name: plspm.formula
### Title: PLS Path Modeling Based on Formula
### Aliases: plspm.formula
### Keywords: plspm.formula

### ** Examples

## Load data (satisfaction data in plspm package)
data("plspmsat")
## Model specification by formulas 
satmodele <- "
            ## measure model specification
              EXPE =~ expe1+expe2+expe3+expe4+expe5
              IMAG =~ imag1+imag2+imag3+imag4+imag5
              LOY =~ loy1+loy2+loy3+loy4
              SAT =~ sat1+sat2+sat3+sat4
              VAL =~ val1+val2+val3+val4 
              QUAL =~ qual1+qual2+qual3+qual4+qual5 
            ## outer model specification 
              EXPE ~~ IMAG
              LOY ~~ IMAG+SAT
              SAT ~~ IMAG+EXPE+QUAL+VAL
              VAL ~~ EXPE+QUAL
              QUAL ~~ EXPE
          "
## estimation modes of latent's blocks
satmodes <- rep("A",6)
## PLSPM model estimation using formula
satres.plspm <- plspm.formula(Formula = satmodele, Data = plspmsat, 
                           modes = satmodes, plot.outer = TRUE, 
                           plot.inner = TRUE, scaled = FALSE)



