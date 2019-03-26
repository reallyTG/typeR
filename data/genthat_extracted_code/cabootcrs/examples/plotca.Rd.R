library(cabootcrs)


### Name: plotca
### Title: Produce correspondence analysis plots with confidence ellipses
### Aliases: plotca
### Keywords: multivariate

### ** Examples


# the main function call plots with the default options

data(DreamData)
bd <- cabootcrs(DreamData)

## Not run: 
##D # Plot with specified size to fit the whole of the arrows in without cropping 
##D  
##D plotca(bd, picsize=c(-2.5,2.5))
##D 
##D # or smaller, note the warning
##D 
##D plotca(bd, picsize=c(-0.5,0.5))
##D 
##D # 90##D 
##D 
##D plotca(bd, plotsymbolscolours=c(3,"differentreds","*","blue"), crpercent=90)
##D 
##D # suppress labels for column points, to de-clutter row points picture,
##D # this mostly useful for larger data sets than this one
##D 
##D plotca(bd, showcolumnlabels=FALSE, datasetname="Dream data")
##D 
##D # only show ellipses for rows 1, 1-2 and 1-3 respectively 
##D 
##D plotca(bd, showrowcrs=1)
##D plotca(bd, showrowcrs=c(1,2))
##D plotca(bd, showrowcrs=1:3)
##D 
##D 
##D # both plots almost the same as the plot from the ca() package
##D 
##D plotca(bd,plottype="french",showrowcrs=FALSE,showcolumncrs=FALSE,othersmonochrome=NULL,
##D         plotsymbolscolours=c(19,"blue",17,"red"),picsize=c(-0.5,0.6))
##D 
##D # plot axes 1 v 2, 1 v 3 and 2 v 3
##D 
##D bd3 <- cabootcrs(DreamData, lastaxis=3)
##D plotca(bd3, firstaxis=1, lastaxis=3, plotallpairs=TRUE)
## End(Not run)

# more complicated plotting, define group structure in data frames

groupingsframe <- cbind(c(1:5,1:4),c(1,1,2,2,3,1,1,2,2))
grouplabframe <- cbind( c(1,2,3,1,2), c("AB","CD","E","ab","cd"), c(19,20,21,"+","*"), 
                        c("green","blue","yellow","red","orange"), "T" )
plotca(bd, groupings=groupingsframe, grouplabels=grouplabframe)

## Not run: 
##D plotca(bd, groupings=groupingsframe, grouplabels=grouplabframe, plottype="french")
## End(Not run)


## The function is currently defined as
function (x, datasetname = "", showrowlabels = TRUE, showcolumnlabels = TRUE, 
    groupings = NULL, grouplabels = NULL, plotsymbolscolours = c(19, 
        "alldifferent", 18, "alldifferent"), othersmonochrome = "black", 
    crpercent = 95, plottype = "biplot", showrowcrs = TRUE, showcolumncrs = TRUE, 
    firstaxis = 1, lastaxis = 2, plotallpairs = FALSE, picsize = c(-1, 
        1)) 
{
    plotonepic <- function(a1, a2, plottype, things, nthings, 
        nvars, Thingcoord, Varcoord, SBvar, SBcov, twoS, inertiapc, 
        resampledistn, multinomialtype, thinggroup, thinggrlab, 
        vargroup, vargrlab, thinglabels, varlabels, showcrs, 
        picsizex, picsizey) {
        eps <- 1e-15
        critchisq2 <- qchisq(0.01 * crpercent, 2)
        critchisq1 <- qchisq(0.01 * crpercent, 1)
        theta <- seq(0, 2 * pi, 0.001)
        ellipsecoords <- rbind(sin(theta), cos(theta))
        thinggrlab3 <- as.list(thinggrlab[[3]])
        thinggrlab3int <- !is.na(as.integer(thinggrlab3))
        for (i in 1:max(thinggroup[, 2])) {
            if (thinggrlab3int[[i]]) {
                thinggrlab3[[i]] <- as.integer(thinggrlab3[[i]])
            }
        }
        if (plottype == "french") {
            vargrlab3 <- as.list(vargrlab[[3]])
            vargrlab3int <- !is.na(as.integer(vargrlab3))
            for (i in 1:max(vargroup[, 2])) {
                if (vargrlab3int[[i]]) {
                  vargrlab3[[i]] <- as.integer(vargrlab3[[i]])
                }
            }
        }
        dev.new()
        plot(Thingcoord[1, a1], Thingcoord[1, a2], xlim = picsizex, 
            ylim = picsizey, xlab = paste("Axis ", a1, "    ", 
                inertiapc[a1], "%", sep = ""), ylab = paste("Axis ", 
                a2, "    ", inertiapc[a2], "%", sep = ""), asp = 1, 
            pch = thinggrlab3[[thinggroup[1, 2]]], col = thinggrlab[[4]][thinggroup[1, 
                2]])
        for (i in 2:nthings) {
            points(Thingcoord[i, a1], Thingcoord[i, a2], asp = 1, 
                pch = thinggrlab3[[thinggroup[i, 2]]], col = thinggrlab[[4]][thinggroup[i, 
                  2]])
        }
        abline(h = 0, v = 0)
        if (!all(thinggrlab[[2]] == "")) {
            labnum <- as.integer(thinggrlab3)
            labchar <- as.character(thinggrlab3)
            legend("topleft", thinggrlab[[2]], pch = labnum, 
                col = thinggrlab[[4]], text.col = thinggrlab[[4]])
            for (i in 1:max(thinggroup[, 2])) {
                if (is.na(labnum[[i]])) {
                  labchar[[i]] <- thinggrlab3[[i]]
                }
                else {
                  labchar[[i]] <- NA
                }
            }
            legend("topleft", thinggrlab[[2]], pch = labchar, 
                col = thinggrlab[[4]], text.col = thinggrlab[[4]])
        }
        if (plottype == "biplot") {
            if ((x@nboots > 0) & (any(showcrs == TRUE))) {
                title(paste("Confidence regions for biplot of", 
                  things, "\n \n", datasetname))
                title(paste("\n", resampledistn, "resampling,", 
                  switch(multinomialtype, whole = "", rowsfixed = "row sums fixed,", 
                    columnsfixed = "column sums fixed,"), x@nboots, 
                  "resamples \n"), font.main = 1)
            }
            else {
                title(paste("Biplot of", things, "\n", datasetname))
            }
            for (i in 1:nvars) {
                lines(c(0, Varcoord[i, a1]), c(0, Varcoord[i, 
                  a2]), col = vargrlab[[4]][vargroup[[2]][i]])
            }
            grat <- cbind(Varcoord[, a1]/picsizex[1], Varcoord[, 
                a1]/picsizex[2], Varcoord[, a2]/picsizey[1], 
                Varcoord[, a2]/picsizey[2], 0.95)/0.95
            cl <- 1.05/apply(grat, 1, max)
            text(cl * Varcoord[, a1], cl * Varcoord[, a2], labels = varlabels, 
                col = vargrlab[[4]][vargroup[[2]]], pos = 4, 
                cex = 0.75)
        }
        else {
            if ((x@nboots > 0) & (any(showcrs == TRUE))) {
                title(paste("Confidence regions for", things, 
                  "\n \n", datasetname))
                title(paste("\n", resampledistn, "resampling,", 
                  switch(multinomialtype, whole = "", rowsfixed = "row sums fixed,", 
                    columnsfixed = "column sums fixed,"), x@nboots, 
                  "resamples \n"), font.main = 1)
            }
            else {
                title(paste("Correspondence plot \n", datasetname))
            }
            for (i in 1:nvars) {
                points(Varcoord[i, a1], Varcoord[i, a2], asp = 1, 
                  pch = vargrlab3[[vargroup[i, 2]]], col = vargrlab[[4]][vargroup[i, 
                    2]])
            }
            text(Varcoord[, a1], Varcoord[, a2], labels = varlabels, 
                col = vargrlab[[4]][vargroup[[2]]], pos = 4, 
                cex = 0.75)
            if (!all(vargrlab[[2]] == "")) {
                labnum <- as.integer(vargrlab3)
                labchar <- as.character(vargrlab3)
                legend("topright", vargrlab[[2]], pch = labnum, 
                  col = vargrlab[[4]], text.col = vargrlab[[4]])
                for (i in 1:max(vargroup[, 2])) {
                  if (is.na(labnum[[i]])) {
                    labchar[[i]] <- vargrlab3[[i]]
                  }
                  else {
                    labchar[[i]] <- NA
                  }
                }
                legend("topright", vargrlab[[2]], pch = labchar, 
                  col = vargrlab[[4]], text.col = vargrlab[[4]])
            }
        }
        for (i in 1:nthings) {
            if (thinggrlab[[5]][thinggroup[i, 2]]) {
                text(Thingcoord[i, a1], Thingcoord[i, a2], labels = thinglabels[i], 
                  pos = 4, cex = 0.75, col = thinggrlab[[4]][thinggroup[i, 
                    2]])
                if (showcrs[i]) {
                  xbar <- Thingcoord[i, cbind(a1, a2)]
                  V <- matrix(c(SBvar[i, a1], SBcov[i, min(a1, 
                    a2), max(a1, a2)], SBcov[i, min(a1, a2), 
                    max(a1, a2)], SBvar[i, a2]), 2, 2)
                  E <- eigen(V, symmetric = TRUE)
                  usec2 <- (1 - twoS[i]) * (E$values[1] > eps)
                  critchisq <- critchisq2 * usec2 + critchisq1 * 
                    (1 - usec2)
                  coords <- E$vectors %*% (critchisq * diag(E$values))^(1/2) %*% 
                    ellipsecoords
                  lines(xbar[1] + coords[1, ], xbar[2] + coords[2, 
                    ], pch = ".", col = thinggrlab[[4]][thinggroup[i, 
                    2]])
                }
            }
        }
        if (any(Thingcoord[, a1] < picsizex[1])) {
            cat(paste("Warning: point outside plot limits, lowest x-value is ", 
                min(Thingcoord[, a1]), "\n"))
        }
        if (any(Thingcoord[, a1] > picsizex[2])) {
            cat(paste("Warning: point outside plot limits, largest x-value is ", 
                max(Thingcoord[, a1]), "\n"))
        }
        if (any(Thingcoord[, a2] < picsizey[1])) {
            cat(paste("Warning: point outside plot limits, lowest y-value is ", 
                min(Thingcoord[, a2]), "\n"))
        }
        if (any(Thingcoord[, a2] > picsizey[2])) {
            cat(paste("Warning: point outside plot limits, largest y-value is ", 
                max(Thingcoord[, a2]), "\n"))
        }
    }
    if (!is.null(plotsymbolscolours)) {
        if (!dim(array(plotsymbolscolours)) == 4) 
            stop(paste("plotsymbolscolours must contain row symbol and colour, 
                        column symbol and colour\n\n"))
    }
    if (!any(plotsymbolscolours[c(2, 4)] == c(colours(), "alldifferent", 
        "differentblues", "differentreds"))) 
        stop(paste("colours must be alldifferent, differentblues, differentreds 
                    or R colour (type colours() for full list) \n\n"))
    if ((crpercent <= 0) | (crpercent >= 100)) 
        stop(paste("coverage percentage must be between 0 and 100 exclusive\n\n"))
    if (!any(plottype == c("biplot", "french"))) 
        stop(paste("plotting must be biplot or french style\n\n"))
    if (!any(class(showrowcrs) == c("integer", "numeric", "logical"))) 
        stop(paste("showrowcrs must be logical or a vector of row numbers\n\n"))
    if (!any(class(showcolumncrs) == c("integer", "numeric", 
        "logical"))) 
        stop(paste("showcolumncrs must be logical or a vector of row numbers\n\n"))
    if ((firstaxis < 1) | (firstaxis > x@axisvariances - 1)) 
        stop(paste("incorrect first axis =", firstaxis, "\n\n"))
    if (lastaxis > x@axisvariances) 
        stop(paste("don't have variances for last axis =", lastaxis, 
            "\n\n"))
    if (firstaxis >= lastaxis) 
        stop(paste("last axis must be greater than first axis\n\n"))
    if (!any(dim(array(picsize)) == c(2, 4))) 
        stop(paste("picsize bounds are  lower,upper OR x lower,x upper,y lower,y upper \n\n"))
    if (picsize[1] >= picsize[2]) 
        stop(paste("incorrect axis scale picsize =", picsize[1], 
            picsize[2], "\n\n"))
    if (dim(array(picsize)) == 4) {
        if (picsize[3] >= picsize[4]) 
            stop(paste("incorrect y axis scale picsize =", picsize[3], 
                picsize[4], "\n\n"))
        if (abs((picsize[4] - picsize[3]) - (picsize[2] - picsize[1])) > 
            1e-10) 
            stop(paste("x and y axes must be same length\n\n"))
    }
    options(warn = -1)
    picsizey <- picsizex <- picsize[1:2]
    if (dim(array(picsize)) == 4) 
        picsizey <- picsize[3:4]
    tworowS <- rowSums(x@DataMatrix > 0) == 2
    twocolS <- colSums(x@DataMatrix > 0) == 2
    if (is.null(groupings)) {
        if (any(plotsymbolscolours[2] == c("alldifferent", "differentreds", 
            "differentblues"))) {
            rowgroup <- as.data.frame(cbind(1:x@rows, 1:x@rows))
            hv <- switch(plotsymbolscolours[2], alldifferent = c(0, 
                0.85), differentreds = c(0, 0.45), differentblues = c(0.5, 
                0.85))
            rowgrlab <- as.data.frame(cbind(1:x@rows, "", plotsymbolscolours[1], 
                rainbow(n = x@rows, start = hv[1], end = hv[2]), 
                "T"), stringsAsFactors = FALSE)
        }
        else {
            rowgroup <- as.data.frame(cbind(1:x@rows, rep(1, 
                x@rows)))
            rowgrlab <- as.data.frame(cbind(1, "", plotsymbolscolours[1], 
                plotsymbolscolours[2], "T"), stringsAsFactors = FALSE)
        }
        class(rowgrlab[, 1]) <- "integer"
        class(rowgrlab[, 5]) <- "logical"
        if (any(plotsymbolscolours[4] == c("alldifferent", "differentreds", 
            "differentblues"))) {
            colgroup <- as.data.frame(cbind(1:x@columns, 1:x@columns))
            hv <- switch(plotsymbolscolours[4], alldifferent = c(0, 
                0.85), differentreds = c(0, 0.45), differentblues = c(0.5, 
                0.85))
            colgrlab <- as.data.frame(cbind(1:x@columns, "", 
                plotsymbolscolours[3], rainbow(n = x@columns, 
                  start = hv[1], end = hv[2]), "T"), stringsAsFactors = FALSE)
        }
        else {
            colgroup <- as.data.frame(cbind(1:x@columns, rep(1, 
                x@columns)))
            colgrlab <- as.data.frame(cbind(1, "", plotsymbolscolours[3], 
                plotsymbolscolours[4], "T"), stringsAsFactors = FALSE)
        }
        class(colgrlab[, 1]) <- "integer"
        class(colgrlab[, 5]) <- "logical"
    }
    else {
        if (class(groupings) == "character") {
            rcgroup <- read.table(file = groupings, colClasses = c("integer", 
                "integer"))
        }
        else {
            rcgroup <- as.data.frame(groupings)
        }
        rowgroup <- rcgroup[1:x@rows, ]
        colgroup <- rcgroup[(x@rows + 1):(x@rows + x@columns), 
            ]
        nrowgroups <- max(rowgroup[, 2])
        ncolgroups <- max(colgroup[, 2])
        if (class(grouplabels) == "character") {
            rcgrlab <- read.table(file = grouplabels, colClasses = c("integer", 
                "character", "character", "character", "logical"))
        }
        else {
            rcgrlab <- as.data.frame(grouplabels, stringsAsFactors = FALSE)
            class(rcgrlab[, 1]) <- "integer"
            class(rcgrlab[, 5]) <- "logical"
        }
        rowgrlab <- rcgrlab[1:nrowgroups, ]
        colgrlab <- rcgrlab[(nrowgroups + 1):(nrowgroups + ncolgroups), 
            ]
    }
    rowcrs <- logical(length = x@rows)
    columncrs <- logical(length = x@columns)
    if (any(class(showrowcrs) == c("numeric", "integer"))) {
        for (i in 1:length(showrowcrs)) {
            rowcrs[showrowcrs[i]] <- TRUE
        }
    }
    else {
        rowcrs <- rowcrs | showrowcrs
    }
    if (any(class(showcolumncrs) == c("numeric", "integer"))) {
        for (i in 1:length(showcolumncrs)) {
            columncrs[showcolumncrs[i]] <- TRUE
        }
    }
    else {
        columncrs <- columncrs | showcolumncrs
    }
    vrowgrlab <- rowgrlab
    vcolgrlab <- colgrlab
    if (any(othersmonochrome == colours())) {
        vrowgrlab[[4]] <- othersmonochrome
        vcolgrlab[[4]] <- othersmonochrome
    }
    if (showrowlabels == TRUE) {
        rowptlabels <- x@rowlabels
    }
    else {
        rowptlabels <- NULL
    }
    if (showcolumnlabels == TRUE) {
        colptlabels <- x@collabels
    }
    else {
        colptlabels <- NULL
    }
    for (a1 in firstaxis:(lastaxis - 1)) {
        for (a2 in (a1 + 1):lastaxis) {
            if ((plotallpairs == TRUE) | ((a1 == firstaxis) & 
                (a2 == lastaxis))) {
                if (plottype == "biplot") {
                  plotonepic(a1, a2, plottype, "rows", x@rows, 
                    x@columns, x@Rowprinccoord, x@Colstdcoord, 
                    x@RowVar, x@RowCov, tworowS, x@inertias[, 
                      2], x@resampledistn, x@multinomialtype, 
                    rowgroup, rowgrlab, colgroup, vcolgrlab, 
                    rowptlabels, colptlabels, rowcrs, picsizex, 
                    picsizey)
                  plotonepic(a1, a2, plottype, "columns", x@columns, 
                    x@rows, x@Colprinccoord, x@Rowstdcoord, x@ColVar, 
                    x@ColCov, twocolS, x@inertias[, 2], x@resampledistn, 
                    x@multinomialtype, colgroup, colgrlab, rowgroup, 
                    vrowgrlab, colptlabels, rowptlabels, columncrs, 
                    picsizex, picsizey)
                }
                else {
                  plotonepic(a1, a2, plottype, "rows", x@rows, 
                    x@columns, x@Rowprinccoord, x@Colprinccoord, 
                    x@RowVar, x@RowCov, tworowS, x@inertias[, 
                      2], x@resampledistn, x@multinomialtype, 
                    rowgroup, rowgrlab, colgroup, vcolgrlab, 
                    rowptlabels, colptlabels, rowcrs, picsizex, 
                    picsizey)
                  plotonepic(a1, a2, plottype, "columns", x@columns, 
                    x@rows, x@Colprinccoord, x@Rowprinccoord, 
                    x@ColVar, x@ColCov, twocolS, x@inertias[, 
                      2], x@resampledistn, x@multinomialtype, 
                    colgroup, colgrlab, rowgroup, vrowgrlab, 
                    colptlabels, rowptlabels, columncrs, picsizex, 
                    picsizey)
                }
            }
        }
    }
    options(warn = 0)
  }



