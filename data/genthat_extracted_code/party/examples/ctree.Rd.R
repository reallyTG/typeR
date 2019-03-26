library(party)


### Name: Conditional Inference Trees
### Title: Conditional Inference Trees
### Aliases: ctree conditionalTree
### Keywords: tree

### ** Examples


    set.seed(290875)

    ### regression
    airq <- subset(airquality, !is.na(Ozone))
    airct <- ctree(Ozone ~ ., data = airq, 
                   controls = ctree_control(maxsurrogate = 3))
    airct
    plot(airct)
    mean((airq$Ozone - predict(airct))^2)
    ### extract terminal node ID, two ways
    all.equal(predict(airct, type = "node"), where(airct))

    ### classification
    irisct <- ctree(Species ~ .,data = iris)
    irisct
    plot(irisct)
    table(predict(irisct), iris$Species)

    ### estimated class probabilities, a list
    tr <- treeresponse(irisct, newdata = iris[1:10,])

    ### ordinal regression
    data("mammoexp", package = "TH.data")
    mammoct <- ctree(ME ~ ., data = mammoexp) 
    plot(mammoct)

    ### estimated class probabilities
    treeresponse(mammoct, newdata = mammoexp[1:10,])

    ### survival analysis
    if (require("TH.data") && require("survival")) {
        data("GBSG2", package = "TH.data")
        GBSG2ct <- ctree(Surv(time, cens) ~ .,data = GBSG2)
        plot(GBSG2ct)
        treeresponse(GBSG2ct, newdata = GBSG2[1:2,])        
    }

    ### if you are interested in the internals:
    ### generate doxygen documentation
    ## Not run: 
##D 
##D         ### download src package into temp dir
##D         tmpdir <- tempdir()
##D         tgz <- download.packages("party", destdir = tmpdir)[2]
##D         ### extract
##D         untar(tgz, exdir = tmpdir)
##D         wd <- setwd(file.path(tmpdir, "party"))
##D         ### run doxygen (assuming it is there)
##D         system("doxygen inst/doxygen.cfg")
##D         setwd(wd)
##D         ### have fun
##D         browseURL(file.path(tmpdir, "party", "inst", 
##D                             "documentation", "html", "index.html")) 
##D     
## End(Not run)



