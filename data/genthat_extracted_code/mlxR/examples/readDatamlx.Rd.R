library(mlxR)


### Name: readDatamlx
### Title: Read formatted data file
### Aliases: readDatamlx

### ** Examples

## Not run: 
##D d <- readDatamlx(project='monolixRuns/warfarin_project.mlxtran')
##D names(d)
##D head(d$treatment)
##D head(d$covariate)
##D head(d$y1)
##D 
##D #-- reserved key-words for the header:
##D #   ID,TIME,AMT,ADM,RATE,TINF,Y,YTYPE,X,COV,CAT,OCC,MDV,EVID,ADDL,SS,II,IGNORE
##D d <- readDatamlx(datafile='monolixRuns/warfarin_data.txt', 
##D                  header=c('id','time','amt','y','ytype','cov','cov','cat'))
## End(Not run)



