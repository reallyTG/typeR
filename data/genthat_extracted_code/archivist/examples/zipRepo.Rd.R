library(archivist)


### Name: zipLocalRepo
### Title: Create a zip Archive From an Existing Repository
### Aliases: zipLocalRepo zipRemoteRepo

### ** Examples

# objects preparation
## Not run: 
##D # data.frame object
##D data(iris)
##D 
##D # ggplot/gg object
##D library(ggplot2)
##D df <- data.frame(gp = factor(rep(letters[1:3], each = 10)),y = rnorm(30))
##D library(plyr)
##D ds <- ddply(df, .(gp), summarise, mean = mean(y), sd = sd(y))
##D myplot123 <- ggplot(df, aes(x = gp, y = y)) +
##D   geom_point() +  geom_point(data = ds, aes(y = mean),
##D                colour = 'red', size = 3)
##D                
##D # lm object                
##D model <- lm(Sepal.Length~ Sepal.Width + Petal.Length + Petal.Width, data= iris)
##D 
##D # Local version
##D 
##D exampleRepoDir <- tempfile()
##D createLocalRepo( repoDir = exampleRepoDir )
##D saveToLocalRepo( myplot123, repoDir=exampleRepoDir )
##D saveToLocalRepo( iris, repoDir=exampleRepoDir )
##D saveToLocalRepo( model, repoDir=exampleRepoDir )
##D 
##D 
##D  
##D zipLocalRepo( exampleRepoDir )
##D 
##D deleteLocalRepo( exampleRepoDir, TRUE)
##D 
##D rm( exampleRepoDir )
##D 
##D # Remote version
##D 
##D zipRemoteRepo( user="MarcinKosinski", 
##D repo="Museum", branch="master", subdir="ex1" )
##D 
##D zipRemoteRepo( user="pbiecek", repo="archivist", repoTo = getwd( ) )
##D 
## End(Not run)




