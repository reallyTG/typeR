library(archivist)


### Name: Tags
### Title: Tags
### Aliases: Tags

### ** Examples


## Not run: 
##D # examples
##D # data.frame object
##D data(iris)
##D exampleRepoDir <- tempfile()
##D createLocalRepo(repoDir = exampleRepoDir)
##D saveToLocalRepo( iris, repoDir=exampleRepoDir )
##D showLocalRepo( exampleRepoDir, "tags" )
##D deleteLocalRepo( exampleRepoDir, deleteRoot=TRUE )
##D 
##D # ggplot/gg object
##D library(ggplot2)
##D df <- data.frame(gp = factor(rep(letters[1:3], each = 10)),y = rnorm(30))
##D library(plyr)
##D ds <- ddply(df, .(gp), summarise, mean = mean(y), sd = sd(y))
##D myplot123 <- ggplot(df, aes(x = gp, y = y)) +
##D   geom_point() +  geom_point(data = ds, aes(y = mean),
##D                              colour = 'red', size = 3)
##D exampleRepoDir <- tempfile()
##D createLocalRepo( repoDir = exampleRepoDir )
##D saveToLocalRepo( myplot123, repoDir=exampleRepoDir )
##D showLocalRepo( exampleRepoDir, "tags" )
##D deleteLocalRepo( exampleRepoDir, deleteRoot=TRUE )
##D 
##D # lm object
##D model <- lm(Sepal.Length~ Sepal.Width + Petal.Length + Petal.Width, 
##D            data= iris)
##D exampleRepoDir <- tempfile()
##D createLocalRepo( repoDir = exampleRepoDir )
##D asave( model, repoDir=exampleRepoDir )
##D showLocalRepo( exampleRepoDir, "tags" )
##D deleteLocalRepo( exampleRepoDir, TRUE )
##D 
##D # agnes (twins) object
##D library(cluster)
##D data(votes.repub)
##D agn1 <- agnes(votes.repub, metric = "manhattan", stand = TRUE)
##D exampleRepoDir <- tempfile()
##D createLocalRepo( repoDir = exampleRepoDir )
##D saveToLocalRepo( agn1, repoDir=exampleRepoDir )
##D showLocalRepo( exampleRepoDir, "tags" )
##D deleteLocalRepo( exampleRepoDir, TRUE )
##D 
##D # fanny (partition) object
##D x <- rbind(cbind(rnorm(10, 0, 0.5), rnorm(10, 0, 0.5)),
##D           cbind(rnorm(15, 5, 0.5), rnorm(15, 5, 0.5)),
##D           cbind(rnorm( 3,3.2,0.5), rnorm( 3,3.2,0.5)))
##D fannyx <- fanny(x, 2)
##D exampleRepoDir <- tempfile()
##D createLocalRepo( repoDir = exampleRepoDir )
##D saveToLocalRepo( fannyx, repoDir=exampleRepoDir )
##D showLocalRepo( exampleRepoDir, "tags" )
##D deleteLocalRepo( exampleRepoDir, TRUE )
##D 
##D # lda object
##D library(MASS)
##D 
##D Iris <- data.frame(rbind(iris3[,,1], iris3[,,2], iris3[,,3]),
##D                    Sp = rep(c("s","c","v"), rep(50,3)))
##D train <- c(8,83,115,118,146,82,76,9,70,139,85,59,78,143,68,
##D            134,148,12,141,101,144,114,41,95,61,128,2,42,37,
##D            29,77,20,44,98,74,32,27,11,49,52,111,55,48,33,38,
##D            113,126,24,104,3,66,81,31,39,26,123,18,108,73,50,
##D            56,54,65,135,84,112,131,60,102,14,120,117,53,138,5)
##D lda1 <- lda(Sp ~ ., Iris, prior = c(1,1,1)/3, subset = train)
##D exampleRepoDir <- tempfile()
##D createLocalRepo( repoDir = exampleRepoDir )
##D asave( lda1, repoDir=exampleRepoDir )
##D showLocalRepo( exampleRepoDir, "tags" )
##D deleteLocalRepo( exampleRepoDir, TRUE )
##D 
##D # qda object
##D tr <- c(7,38,47,43,20,37,44,22,46,49,50,19,4,32,12,29,27,34,2,1,17,13,3,35,36)
##D train <- rbind(iris3[tr,,1], iris3[tr,,2], iris3[tr,,3])
##D cl <- factor(c(rep("s",25), rep("c",25), rep("v",25)))
##D qda1 <- qda(train, cl)
##D exampleRepoDir <- tempfile()
##D createLocalRepo( repoDir = exampleRepoDir )
##D saveToLocalRepo( qda1, repoDir=exampleRepoDir )
##D showLocalRepo( exampleRepoDir, "tags" )
##D deleteLocalRepo( exampleRepoDir, TRUE )
##D 
##D 
##D # glmnet object
##D library( glmnet )
##D 
##D zk=matrix(rnorm(100*20),100,20)
##D bk=rnorm(100)
##D glmnet1=glmnet(zk,bk)
##D exampleRepoDir <- tempfile()
##D createLocalRepo( repoDir = exampleRepoDir )
##D saveToLocalRepo( glmnet1, repoDir=exampleRepoDir )
##D showLocalRepo( exampleRepoDir, "tags" )
##D deleteLocalRepo( exampleRepoDir, TRUE )
##D 
##D # trellis object
##D require(stats)
##D library( lattice)
##D ## Tonga Trench Earthquakes
##D 
##D Depth <- equal.count(quakes$depth, number=8, overlap=.1)
##D xyplot(lat ~ long | Depth, data = quakes)
##D update(trellis.last.object(),
##D        strip = strip.custom(strip.names = TRUE, strip.levels = TRUE),
##D        par.strip.text = list(cex = 0.75),
##D        aspect = "iso")
##D 
##D ## Examples with data from `Visualizing Data' (Cleveland, 1993) obtained
##D ## from http://cm.bell-labs.com/cm/ms/departments/sia/wsc/
##D 
##D EE <- equal.count(ethanol$E, number=9, overlap=1/4)
##D 
##D ## Constructing panel functions on the run; prepanel
##D trellis.plot <- xyplot(NOx ~ C | EE, data = ethanol,
##D                        prepanel = function(x, y) prepanel.loess(x, y, span = 1),
##D                        xlab = "Compression Ratio", ylab = "NOx (micrograms/J)",
##D                        panel = function(x, y) {
##D                          panel.grid(h = -1, v = 2)
##D                          panel.xyplot(x, y)
##D                          panel.loess(x, y, span=1)
##D                        },
##D                        aspect = "xy")
##D exampleRepoDir <- tempfile()
##D createLocalRepo( repoDir = exampleRepoDir )
##D saveToLocalRepo( trellis.plot, repoDir=exampleRepoDir )
##D showLocalRepo( exampleRepoDir, "tags" )
##D deleteLocalRepo( exampleRepoDir, TRUE )
##D 
##D # htest object
##D 
##D x <- c(1.83,  0.50,  1.62,  2.48, 1.68, 1.88, 1.55, 3.06, 1.30)
##D y <- c(0.878, 0.647, 0.598, 2.05, 1.06, 1.29, 1.06, 3.14, 1.29)
##D this.test <- wilcox.test(x, y, paired = TRUE, alternative = "greater")
##D exampleRepoDir <- tempfile()
##D createLocalRepo( repoDir = exampleRepoDir )
##D saveToLocalRepo( this.test, repoDir=exampleRepoDir )
##D showLocalRepo( exampleRepoDir, "tags" )
##D deleteLocalRepo( exampleRepoDir, TRUE )
##D 
##D # survfit object
##D library( survival )
##D # Create the simplest test data set 
##D test1 <- list(time=c(4,3,1,1,2,2,3), 
##D               status=c(1,1,1,0,1,1,0), 
##D              x=c(0,2,1,1,1,0,0), 
##D              sex=c(0,0,0,0,1,1,1)) 
##D # Fit a stratified model 
##D myFit <-  survfit( coxph(Surv(time, status) ~ x + strata(sex), test1), data = test1  )
##D exampleRepoDir <- tempfile()
##D createLocalRepo( repoDir = exampleRepoDir )
##D saveToLocalRepo( myFit , repoDir=exampleRepoDir )
##D showLocalRepo( exampleRepoDir, "tags" )[,-3]
##D deleteLocalRepo( exampleRepoDir, TRUE)
##D 
##D # origin of the artifacts stored as a name - chaining code
##D library(dplyr)
##D exampleRepoDir <- tempfile()
##D createLocalRepo( repoDir = exampleRepoDir )
##D data("hflights", package = "hflights")
##D hflights %>%
##D   group_by(Year, Month, DayofMonth) %>%
##D   select(Year:DayofMonth, ArrDelay, DepDelay) %>%
##D   saveToLocalRepo( exampleRepoDir, value = TRUE ) %>%
##D   # here the artifact is stored but chaining is not finished
##D   summarise(
##D     arr = mean(ArrDelay, na.rm = TRUE),
##D     dep = mean(DepDelay, na.rm = TRUE)
##D   ) %>%
##D   filter(arr > 30 | dep > 30) %>%
##D   saveToLocalRepo( exampleRepoDir ) 
##D   # chaining code is finished and after last operation the 
##D   # artifact is stored
##D showLocalRepo( exampleRepoDir, "tags" )[,-3]
##D showLocalRepo( exampleRepoDir )
##D deleteLocalRepo( exampleRepoDir, TRUE)
##D 
##D rm( exampleRepoDir )
## End(Not run)



