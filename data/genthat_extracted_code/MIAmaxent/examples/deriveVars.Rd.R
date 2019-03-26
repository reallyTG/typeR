library(MIAmaxent)


### Name: deriveVars
### Title: Derive variables by transformation.
### Aliases: deriveVars

### ** Examples

toydata_dvs <- deriveVars(toydata_sp1po, c("L", "M", "D", "HF", "HR", "T", "B"))
str(toydata_dvs$dvdata)
summary(toydata_dvs$transformations)

## Not run: 
##D # From vignette:
##D grasslandDVs <- deriveVars(grasslandPO,
##D                            transformtype = c("L","M","D","HF","HR","T","B"))
##D summary(grasslandDVs$dvdata)
##D head(summary(grasslandDVs$transformations))
##D length(grasslandDVs$transformations)
##D plot(grasslandPO$terslpdg, grasslandDVs$dvdata$terslpdg$terslpdg_D2, pch=20,
##D      ylab="terslpdg_D2")
##D plot(grasslandPO$terslpdg, grasslandDVs$dvdata$terslpdg$terslpdg_M, pch=20,
##D      ylab="terslpdg_M")
## End(Not run)




