library(DESnowball)


### Name: snowball
### Title: main function for Snowball analysis
### Aliases: snowball

### ** Examples

require(DESnowball)
data(snowball.demoData)
# check the demo dataset
print(sb.mutation)
head(sb.expression)
## A test run
Bn <- 10000
ncore <-4
# call Snowball
## Not run: 
##D sb <- snowball(y=sb.mutation,X=sb.expression,
##D 	          ncore=ncore,d=100,B=Bn,
##D 	          sample.n=1)
##D # process the gene ranking and selection
##D sb.sel <- select.features(sb)
##D # plot the Jn values
##D plotJn(sb, sb.sel)
##D # get the significant gene list
##D top.genes <- toplist(sb.sel)
## End(Not run)



