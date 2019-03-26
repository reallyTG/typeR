library(archivist)


### Name: asearch
### Title: Read Artifacts Given as a List of Tags
### Aliases: asearch

### ** Examples

## Not run: 
##D ### default LOCAL version
##D ## objects preparation
##D 
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
##D                              colour = 'red', size = 3)
##D 
##D # lm object
##D model <- lm(Sepal.Length~ Sepal.Width + Petal.Length + Petal.Width, data= iris)
##D model2 <- lm(Sepal.Length~ Sepal.Width + Petal.Width, data= iris)
##D model3 <- lm(Sepal.Length~ Sepal.Width, data= iris)
##D 
##D ## creating example default local repository
##D exampleRepoDir <- tempfile()
##D createLocalRepo(repoDir = exampleRepoDir)
##D ## setting default local repository
##D setLocalRepo( repoDir = exampleRepoDir )
##D 
##D saveToLocalRepo(myplot123)
##D saveToLocalRepo(iris)
##D saveToLocalRepo(model)
##D saveToLocalRepo(model2)
##D saveToLocalRepo(model3)
##D 
##D ## Searching for objects of class:lm
##D lm <- asearch(patterns = "class:lm")
##D 
##D ## Searching for objects of class:lm with coefname:Petal.Width
##D lm_c_PW <- asearch(patterns = c("class:lm","coefname:Petal.Width"))
##D 
##D # Note that we searched for objects. Then loaded them from repository by their value.
##D 
##D 
##D ## deleting example repository
##D deleteLocalRepo(repoDir = exampleRepoDir, deleteRoot = TRUE)
##D rm(exampleRepoDir)
##D 
##D ### default GitHub version
##D ## Setting default github repository
##D setRemoteRepo( user = "pbiecek", repo = "archivist")
##D 
##D showRemoteRepo(method = "tags")$tag
##D searchInRemoteRepo(pattern = "class:lm")
##D searchInRemoteRepo(pattern = "class:gg")
##D getTagsRemote(md5hash = "cd6557c6163a6f9800f308f343e75e72", tag = "")
##D 
##D ## Searching for objects of class:lm
##D asearch(patterns = c("class:lm"))
##D ## Searching for objects of class:gg
##D ggplot_objects <- asearch(patterns = c("class:gg"))
##D # names(ggplot_objects)
##D # To plot them remember to have ggplot2 in version 2.1.0
##D # as this is stated in asession("pbiecek/archivist/13b2724139eb2c62578b4dab0d7b2cea") or
##D asession("pbiecek/archivist/7f3453331910e3f321ef97d87adb5bad") .
##D # The state of R libraries can be restored to the same state in
##D # which those objects were created with the restoreLibs function.
##D 
##D 
##D ### Remote version 
##D ## Note that repo argument is passed in the following way to asearch:
##D ## repo = "GitHub user name/GitHub repository name"
##D 
##D ## Searching for objects of class:gg
##D asearch("pbiecek/graphGallery", 
##D         patterns = c("class:gg",
##D                      "labelx:Sepal.Length")) -> ggplots_objects_v2
## End(Not run)



