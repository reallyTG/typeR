### R code from vignette source 'ltxsparklines.Rnw'

###################################################
### code chunk number 1: ltxsparklines.Rnw:156-157
###################################################
library(ltxsparklines)


###################################################
### code chunk number 2: ltxsparklines.Rnw:175-177
###################################################
options(ltxsparklines.output='inlineSweave') # Comment out 
                                             # if using knitr


###################################################
### code chunk number 3: ltxsparklines.Rnw:182-192
###################################################
options(
    ltxsparklines.width = 10,
    ltxsparklines.clip = FALSE,
    ltxsparklines.na.rm = TRUE,
    ltxsparklines.bottomline = FALSE,
    ltxsparklines.bottomlinex = c(NA, NA),
    ltxsparklines.startdotcolor = NA,
    ltxsparklines.enddotcolor = NA,
    ltxsparklines.dotcolor='blue'
    )


###################################################
### code chunk number 4: ltxsparklines.Rnw:197-223
###################################################
pr <- function (string) 
   paste0("\\\\texttt{\\\\textbackslash Sexpr\\\\{",string,"\\\\}}")
# if using knitr, change to 
# pr <- function (string) 
#   paste0("\\texttt{\\textbackslash Sexpr\\{",string,"\\}}")
ev <- function (string) eval(parse(text=string))
twovect <- "sparkline(x=c(1,4,8,10), y=c(5,6,12,3), 
            enddotcolor='red')"
twovectspikes <- "sparkline(xspikes=c(1,4,8,10), yspikes=c(5,6,12,3),
                            width=3)"
twovectdots <- "sparkline(xdots =c(1,4,8,10), ydots=c(5,6,12,3), 
                           dotcolor=c('green', 'red'))"
twovectdotsparks <- "sparkline(x =c(1,4,8,10), y=c(5,6,12,3), 
                           xdots=c(1,4,8,10), ydots=c(5,6,12,3), 
                           dotcolor=c('green', 'red'))"
carsplot <- "sparkline(yspikes=cars, width=20)"
carsplot_reverse <- "sparkline(yspikes=cars[,c(2,1)], width=20)"
onevect <- "sparkline(c(1,8,-5,10), startdotcolor='green', 
            bottomline=TRUE)"
plot_matrix <- "mat <- matrix(c(1, 2, 3, 4, 5, 17, 10, 12, 11, 10), 
                ncol=2, byrow=F); 
                sparkline(mat, rectangle=c(10,16), 
                startdotcolor='blue')"
plot_Nile <- "sparkline(Nile, width=30)"
rm_t <- "sparkline(c(3,5,4,NA,12,9), na.rm=TRUE)"
rm_f <- "sparkline(c(3,5,4,NA,12,9), na.rm=FALSE)"


###################################################
### code chunk number 5: ltxsparklines.Rnw:270-276
###################################################
yrange1 <- "sparkline(c(2,4,8,12,16))"
yrange2 <- "sparkline(c(2,4,8,12,16), ylim=c(NA,20))"
yrange3 <- "sparkline(c(2,4,8,12,16), ylim=c(-10,20))"
xyrange <- "sparkline(c(2,20,1,16,4), ylim=c(NA,10), xlim=c(2,5))"
xyrange_clip <- "sparkline(c(2,20,1,16,4), ylim=c(NA,10), xlim=c(2,5),
                           clip=TRUE)"


###################################################
### code chunk number 6: ltxsparklines.Rnw:307-314
###################################################
rect1 <- "sparkline(Nile, rectangle=quantile(Nile, c(0.025, 0.975)),
          width=30)"
bottomline1 <- "sparkline(c(2,4,1,12,3), bottomline=TRUE)"
bottomline2 <- "sparkline(c(2,4,1,12,3), bottomline=TRUE,
                bottomlinelength=4)"
bottomlinex <- "sparkline(c(2,4,1,12,3), 
                bottomlinex=c(2,4))"


###################################################
### code chunk number 7: ltxsparklines.Rnw:361-365
###################################################
decadeStarts <- seq(min(time(Nile)), max(time(Nile)), 
                    by=10)
rangeNile <- range(Nile)
iqrNile <- quantile(Nile, c(0.25, 0.75))


###################################################
### code chunk number 8: ltxsparklines.Rnw:370-381
###################################################
printDecade <- function (start) {
    end <- start+9
    paste0(start, "--", end, " & ",
           sparkline(window(Nile, start, end),
                     width=20,
                     xlim=c(start, end),
                     ylim=rangeNile,
                     rectangle=iqrNile,
                     output='knitr'),
           "\\\\")
}


###################################################
### code chunk number 9: ltxsparklines.Rnw:386-404
###################################################
# Table header
result <- paste("\\begin{tabular}{ll}",
                 "\\toprule",
                 "Decade & Annual flow\\\\",
                 "\\midrule",
                 sep="\n")
# Table body
result <- paste(result,
                paste(sapply(decadeStarts, printDecade),
                      collapse="\n"),
                sep="\n")
# Table footer
result <- paste(result,
                 "\\bottomrule",
                 "\\end{tabular}",
                 sep="\n")
# Printing table
cat(result)


