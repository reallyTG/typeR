## ----include=FALSE-------------------------------------------------------
library(knitr)
knitr::opts_chunk$set(fig.width=7, fig.height=7, comment="")

## ------------------------------------------------------------------------
library(repo)
rp <- repo_open(tempdir(), force=T)

## ------------------------------------------------------------------------
rp$attach("index.Rmd", "Source code for Repo vignette")
rp$options(src="index.Rmd")

## ---- eval=F-------------------------------------------------------------
#  myiris <- scale(as.matrix(iris[,1:4]))

## ---- eval=F-------------------------------------------------------------
#  rp$put(myiris)

## ------------------------------------------------------------------------
## chunk "myiris" {
myiris <- scale(as.matrix(iris[,1:4]))

rp$put(
    obj = myiris,
    name = "myiris", 
    description = paste(
        "A normalized version of the iris dataset coming with R.",
        "Normalization is made with the scale function",
        "with default parameters."
    ),
    tags = c("dataset", "iris", "repodemo")
)
## }

## ------------------------------------------------------------------------
rp$chunk("myiris")

## ------------------------------------------------------------------------
rp$rm("myiris")
rp$build("myiris", "index.Rmd")

## ------------------------------------------------------------------------
rp$put(iris$Species, "irisLabels",
		     tags = c("labels", "iris", "repodemo"))

## ------------------------------------------------------------------------
irispca <- princomp(myiris)
iris2d <- irispca$scores[,c(1,2)]
plot(iris2d, main="2D visualization of the Iris dataset",
     col=rp$get("irisLabels"))

## ------------------------------------------------------------------------
fpath <- file.path(rp$root(), "iris2D.pdf")
pdf(fpath)
plot(iris2d, main="2D visualization of the Iris dataset",
     col=rp$get("irisLabels"))
invisible(dev.off())
rp$attach(fpath, "Iris 2D visualization obtained with PCA.",
            c("visualization", "iris", "repodemo"),
              to="myiris")

## ---- eval=FALSE---------------------------------------------------------
#  rp$sys("iris2D.pdf", "evince")

## ------------------------------------------------------------------------
kiris <- kmeans(myiris, 5)$cluster
rp$put(kiris, "iris_5clu", "Kmeans clustering of the Iris data, k=5.",
         c("metadata", "iris", "kmeans", "clustering", "repodemo"),
           depends="myiris")

## ------------------------------------------------------------------------
plot(iris2d, main="Iris dataset kmeans clustering", col=kiris)

## ------------------------------------------------------------------------
fpath <- file.path(rp$root(), "iris2Dclu.pdf")
pdf(fpath)
plot(iris2d, main="Iris dataset kmeans clustering", col=kiris)
invisible(dev.off())
rp$attach(fpath, "Iris K-means clustering.",
	c("visualization", "iris", "clustering", "kmeans", "repodemo"),
	 		   to="iris_5clu")

## ------------------------------------------------------------------------
res <- table(rp$get("irisLabels"), kiris)
rp$put(res, "iris_cluVsSpecies",
         paste("Contingency table of the kmeans clustering versus the",
               "original labels of the Iris dataset."),
         c("result", "iris","validation", "clustering", "repodemo", "hide"),
         src="index.Rmd", depends=c("myiris", "irisLabels", "iris_5clu"))

## ------------------------------------------------------------------------
rp$info()

## ------------------------------------------------------------------------
rp ## resolves to print(rp)

## ------------------------------------------------------------------------
print(rp, all=T)

## ------------------------------------------------------------------------
print(rp, tags="clustering", all=T)

## ------------------------------------------------------------------------
rp$print(show="st")

## ------------------------------------------------------------------------
rp$find("clu", all=T)

## ------------------------------------------------------------------------
rp$pies()

## ------------------------------------------------------------------------
rp$check()

## ------------------------------------------------------------------------
depgraph <- rp$dependencies(plot=F)
library(knitr)
kable(depgraph)

## ------------------------------------------------------------------------
if(require("igraph", NULL, T, F))
     rp$dependencies()

## ------------------------------------------------------------------------
if(require("igraph"))
    rp$dependencies(generated=F)

## ------------------------------------------------------------------------
x <- rp$get("myiris")

## ------------------------------------------------------------------------
rm("myiris")
rp$load("myiris")
"myiris" %in% ls()

## ------------------------------------------------------------------------
rp$info("myiris")

## ------------------------------------------------------------------------
kiris2 <- kmeans(myiris, 5)$cluster
rp$put(kiris2, "iris_5clu",
         "Kmeans clustering of the Iris data, k=5. Today's version!",
           depends="myiris", replace="addversion")

## ------------------------------------------------------------------------
rp

## ------------------------------------------------------------------------
rp$info("iris_5clu")

## ------------------------------------------------------------------------
rp$info("iris_5clu#1")

## ------------------------------------------------------------------------

## First run
system.time(rp$lazydo(
    {
	Sys.sleep(.5)
	result <- "This took half a second to compute"
    }
))

## Second run
system.time(rp$lazydo(
    {
	Sys.sleep(.5)
	result <- "This took half a second to compute"
    }
))
	


## ------------------------------------------------------------------------
rp$put("Local content", "item1",
	"This points to big data you may want to download",
	"tag", URL="http://exampleURL/repo")
print(rp$get("item1"))

## ---- eval=F-------------------------------------------------------------
#  rp$pull("item1", replace=T)

## ---- include=F----------------------------------------------------------
rp$set("item1", obj="Remote content")

## ------------------------------------------------------------------------
print(rp$get("item1"))

## ------------------------------------------------------------------------
h <- rp$handlers()
names(h)

## ------------------------------------------------------------------------
print(h$iris_cluVsSpecies())

## ------------------------------------------------------------------------
h$iris_cluVsSpecies("tag", "onenewtag")
h$iris_cluVsSpecies("info")

## ------------------------------------------------------------------------
h <- repo_open(rp$root())$handlers()

## ------------------------------------------------------------------------
h$repo

## ------------------------------------------------------------------------
h <- h$repo$handlers()

## ---- eval=FALSE---------------------------------------------------------
#  help(repo)

## ---- eval=FALSE---------------------------------------------------------
#  help(repo_func)

## ---- include=F----------------------------------------------------------
unlink(rp$root(), recursive=T)

