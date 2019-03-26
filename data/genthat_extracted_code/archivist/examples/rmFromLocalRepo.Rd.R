library(archivist)


### Name: rmFromLocalRepo
### Title: Remove an Artifact Given as a md5hash from the Repository
### Aliases: rmFromLocalRepo rmFromRepo

### ** Examples

## Not run: 
##D # objects preparation
##D data.frame object
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
##D # agnes (twins) object
##D library(cluster)
##D data(votes.repub)
##D agn1 <- agnes(votes.repub, metric = "manhattan", stand = TRUE)
##D 
##D # fanny (partition) object
##D x <- rbind(cbind(rnorm(10, 0, 0.5), rnorm(10, 0, 0.5)),
##D            cbind(rnorm(15, 5, 0.5), rnorm(15, 5, 0.5)),
##D            cbind(rnorm( 3,3.2,0.5), rnorm( 3,3.2,0.5)))
##D fannyx <- fanny(x, 2)
##D 
##D # creating example Repository - on which examples will work
##D 
##D exampleRepoDir <- tempfile()
##D createLocalRepo(repoDir = exampleRepoDir)
##D myplot123Md5hash <- saveToLocalRepo(myplot123, repoDir=exampleRepoDir)
##D irisMd5hash <- saveToLocalRepo(iris, repoDir=exampleRepoDir)
##D modelMd5hash  <- saveToLocalRepo(model, repoDir=exampleRepoDir)
##D agn1Md5hash <- saveToLocalRepo(agn1, repoDir=exampleRepoDir)
##D fannyxMd5hash <- saveToLocalRepo(fannyx, repoDir=exampleRepoDir)
##D 
##D # let's see how the Repository looks like: show
##D showLocalRepo(method = "md5hashes", repoDir = exampleRepoDir)
##D showLocalRepo(method = "tags", repoDir = exampleRepoDir)
##D 
##D # let's see how the Repository looks like: summary
##D summaryLocalRepo( exampleRepoDir )
##D 
##D # remove examples
##D 
##D rmFromLocalRepo(fannyxMd5hash, repoDir = exampleRepoDir)
##D # removeData = FALSE default argument provides from removing archived
##D # fannyxMd5hash object's data from the Repository and the gallery
##D rmFromLocalRepo(irisMd5hash, repoDir = exampleRepoDir)
##D  
##D # let's see how the Repository looks like: show
##D showLocalRepo(method = "md5hashes", repoDir = exampleRepoDir)
##D showLocalRepo(method = "tags", repoDir = exampleRepoDir)
##D 
##D # let's see how the Repository looks like: summary
##D summaryLocalRepo( exampleRepoDir )
##D 
##D 
##D # one can have the same object archived three different times,
##D # there will appear a warning message
##D agn1Md5hash2 <- saveToLocalRepo(agn1, repoDir=exampleRepoDir)
##D agn1Md5hash3 <- saveToLocalRepo(agn1, repoDir=exampleRepoDir)
##D 
##D # md5hashes are the same for the same object (agn1)
##D agn1Md5hash == agn1Md5hash2
##D agn1Md5hash2 == agn1Md5hash3
##D 
##D # but in the Repository database (backpack.db)
##D # there are three identical rows describing the object
##D # as well as three identical rows describing object's data.
##D 
##D # let's see how the Repository looks like: show
##D showLocalRepo(method = "md5hashes", repoDir = exampleRepoDir)
##D showLocalRepo(method = "tags", repoDir = exampleRepoDir)
##D 
##D # let's see how the Repository looks like: summary
##D summaryLocalRepo( exampleRepoDir )
##D # in spite of multiplying object's appearance in database it is
##D 
##D # one easy call removes them all but this call will result in error
##D rmFromLocalRepo(agn1Md5hash, repoDir = exampleRepoDir, removeData = TRUE, 
##D             removeMiniature = TRUE)
##D 
##D # soultion to that is
##D rmFromLocalRepo(agn1Md5hash, repoDir = exampleRepoDir, removeData = TRUE, 
##D             removeMiniature = TRUE, force = TRUE)
##D # removeMiniature = TRUE removes miniatures from the gallery folder
##D 
##D # rest of the artifacts can be removed for example by
##D # looking for dates of creation and then removing all objects
##D # created in a specific period of time
##D 
##D obj2rm <- searchInLocalRepo( pattern = list(dateFrom = Sys.Date(), dateTo = Sys.Date()),
##D                              repoDir = exampleRepoDir )
##D sapply(obj2rm, rmFromLocalRepo, repoDir = exampleRepoDir)
##D # above function call removed all objects which were created in these examples.
##D # Note that in the gallery folder there may be still some miniatures as
##D # removeMiniature parameter is set to FALSE
##D 
##D # let's see how the Repository looks like: show
##D showLocalRepo(method = "md5hashes", repoDir = exampleRepoDir)
##D showLocalRepo(method = "tags", repoDir = exampleRepoDir)
##D 
##D # one can also delete objects of a specific class
##D modelMd5hash  <- saveToLocalRepo(model, repoDir=exampleRepoDir)
##D model2Md5hash  <- saveToLocalRepo(model2, repoDir=exampleRepoDir)
##D model3Md5hash  <- saveToLocalRepo(model3, repoDir=exampleRepoDir)
##D showLocalRepo(method = "md5hashes", repoDir = exampleRepoDir)
##D 
##D objMd5hash <- searchInLocalRepo("class:lm", repoDir = exampleRepoDir)
##D sapply(objMd5hash, rmFromLocalRepo, repoDir = exampleRepoDir, removeData = TRUE, force = TRUE)
##D showLocalRepo(method = "md5hashes", repoDir = exampleRepoDir)
##D summaryLocalRepo( exampleRepoDir )
##D 
##D 
##D # one can remove object specifying only its md5hash abbreviation
##D (myplo123Md5hash <- saveToLocalRepo(myplot123, repoDir=exampleRepoDir))
##D showLocalRepo(method = "md5hashes", repoDir = exampleRepoDir)
##D 
##D # If md5hash is "db50a4e667581f8c531acd78ad24bfee" then
##D # model abbreviation might be : "db50a"
##D # Note that with each evaluation of createEmptyRepo function new md5hashes
##D # are created. This is why, in your evaluation of the code, artifact 
##D # myplo123Md5hash will have a different md5hash and the following
##D # instruction will result in an error.
##D rmFromLocalRepo("db40a", repoDir = exampleRepoDir, removeData = TRUE)
##D summaryLocalRepo( repoDir = exampleRepoDir )
##D 
##D 
##D # removing an example Repository
##D 
##D deleteLocalRepo( exampleRepoDir, TRUE)
##D 
##D 
##D ######
##D ######
##D REMOVING MANY ARTIFACTS
##D ######
##D ######
##D 
##D data(iris)
##D 
##D # lm object
##D model <- lm(Sepal.Length~ Sepal.Width + Petal.Length + Petal.Width, data= iris)
##D 
##D # agnes (twins) object
##D library(cluster)
##D data(votes.repub)
##D agn1 <- agnes(votes.repub, metric = "manhattan", stand = TRUE)
##D 
##D # fanny (partition) object
##D x <- rbind(cbind(rnorm(10, 0, 0.5), rnorm(10, 0, 0.5)),
##D            cbind(rnorm(15, 5, 0.5), rnorm(15, 5, 0.5)),
##D            cbind(rnorm( 3,3.2,0.5), rnorm( 3,3.2,0.5)))
##D fannyx <- fanny(x, 2)
##D 
##D # lda object
##D library(MASS)
##D 
##D Iris <- data.frame(rbind(iris3[,,1], iris3[,,2], iris3[,,3]),
##D                   Sp = rep(c("s","c","v"), rep(50,3)))
##D train <- c(8,83,115,118,146,82,76,9,70,139,85,59,78,143,68,
##D            134,148,12,141,101,144,114,41,95,61,128,2,42,37,
##D            29,77,20,44,98,74,32,27,11,49,52,111,55,48,33,38,
##D            113,126,24,104,3,66,81,31,39,26,123,18,108,73,50,
##D            56,54,65,135,84,112,131,60,102,14,120,117,53,138,5)
##D lda1 <- lda(Sp ~ ., Iris, prior = c(1,1,1)/3, subset = train)
##D 
##D # qda object
##D tr <- c(7,38,47,43,20,37,44,22,46,49,50,19,4,32,12,29,27,34,2,1,17,13,3,35,36)
##D train <- rbind(iris3[tr,,1], iris3[tr,,2], iris3[tr,,3])
##D cl <- factor(c(rep("s",25), rep("c",25), rep("v",25)))
##D qda1 <- qda(train, cl)
##D 
##D # glmnet object
##D library( glmnet )
##D 
##D zk=matrix(rnorm(100*20),100,20)
##D bk=rnorm(100)
##D glmnet1=glmnet(zk,bk)
##D  
##D # Creating example Repository so that we may see it on our computer
##D 
##D exampleRepoDir <- tempfile()
##D createLocalRepo( repoDir = exampleRepoDir, force = TRUE)
##D saveToLocalRepo( iris, repoDir=exampleRepoDir)
##D saveToLocalRepo( model, repoDir=exampleRepoDir )
##D saveToLocalRepo( agn1, repoDir=exampleRepoDir )
##D saveToLocalRepo( fannyx, repoDir=exampleRepoDir )
##D saveToLocalRepo( lda1, repoDir=exampleRepoDir )
##D saveToLocalRepo( glmnet1, repoDir=exampleRepoDir )
##D 
##D ArtifactsAndData <- unique(showLocalRepo(repoDir = exampleRepoDir)[,1])
##D ArtifactsData <- unique(searchInLocalRepo(pattern = "relationWith", fixed = FALSE,
##D                                    repoDir = exampleRepoDir))
##D Artifacts <- setdiff(ArtifactsAndData, ArtifactsData)
##D 
##D 
##D # Removing many artifacts with many = TRUE argument
##D rmFromLocalRepo(Artifacts, repoDir = exampleRepoDir, many = TRUE)
##D 
##D # We may notice, in two ways, that artifacts' data is still in "exampleRepoDir".
##D # Either we may look into gallery folder of "exampleRepoDir" 
##D list.files(file.path(exampleRepoDir, "gallery"))
##D # or show how database.db file looks like.
##D showLocalRepo(repoDir = exampleRepoDir) # artifacts' data is there indeed!
##D 
##D # If we want to remove artifact's data now we simply call rmFromLocalRepo function
##D # with removeData = TRUE additional argument.
##D rmFromLocalRepo(Artifacts, repoDir = exampleRepoDir, removeData = TRUE,  many = TRUE)
##D 
##D # We receive a warning as Artifacts are no longer in the repository. 
##D # However, let's check what happened with Artifact's data.
##D showLocalRepo(repoDir = exampleRepoDir) # They were removed.
##D # Perhaps you may think that "exampleRepoDir" is empty as database indicates. However,
##D # if you look into gallery folder there will be some ".txt" or ".png" files. 
##D list.files(file.path(exampleRepoDir, "gallery"))
##D 
##D # Those are probably, the so called, Miniatures. Let's try to remove them.
##D # In order to do it we call rmFromLocalRepo function with removeMiniature = TRUE argument.
##D rmFromLocalRepo(Artifacts, many = TRUE, repoDir = exampleRepoDir, removeMiniature = TRUE)
##D 
##D # Again we receive a warning as Artifacts are no longer in the repository but ...
##D list.files(file.path(exampleRepoDir, "gallery")) 
##D # gallery folder is empty now! Artifact's miniature's were removed.
##D 
##D 
##D # Of course we may have done all these instructions by one simple function call.
##D # rmFromLocalRepo(Artifacts, many = TRUE, repoDir = exampleRepoDir,
##D #            removeData = TRUE, removeMiniature = TRUE)
##D # Nevertheless, it may be instructive to see how it is done step by step.
##D 
##D # removing an example Repository
##D deleteLocalRepo(repoDir = exampleRepoDir, deleteRoot = TRUE)
##D    
##D rm( exampleRepoDir )
## End(Not run)



