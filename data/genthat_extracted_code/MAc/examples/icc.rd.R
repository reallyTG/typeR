library(MAc)


### Name: icc
### Title: Intraclass correlation coefficient (ICC) for oneway and twoway
###   models
### Aliases: icc

### ** Examples

# sample data

study <- c(1,1,2,2,3,3)
rater <- c(rep(1:2,3))
mod1 <- round(rnorm(6, 10, 1))
mod2 <- c(5,5, 9, 9, 8, 8)
mod3 <- c(10,10, 9, 9, 8, 8)
w <-data.frame(study, rater, mod1, mod2, mod3)
w


# if data is in this format:

# study rater mod1 mod2 mod3
#     1     1    9    9   10
#     1     2   11    8   10
#     2     1    9   10   11
#     2     2    9   10   11
#     3     1    9    9    8
#     3     2   12    9    8
#
# the data will need to be reshaped to be processed by the 
# icc function:

long <- reshape(w, varying=colnames(w)[3:5], v.names="Code", 
            idvar=c('study', 'rater'), timevar="mods", direction='long')
wide <- reshape(long, idvar=c('mods', 'study'), timevar='rater')

# icc function (created by Matthias Gamer for the 'irr' package)

icc(cbind(wide$Code.1, wide$Code.2), type= "consistency")



