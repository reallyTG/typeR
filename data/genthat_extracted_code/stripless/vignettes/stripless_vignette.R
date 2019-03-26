## ----global_options, echo = FALSE----------------------------------------
knitr::opts_chunk$set(dev="pdf", fig.width=6, fig.height=6, fig.align = "center", warning=FALSE, message=FALSE)

## ----usual_required_packages, echo = FALSE-------------------------------
## Load required packages
require(stats, quietly = TRUE)
require(graphics, quietly = TRUE)
require(datasets, quietly = TRUE)
require(grid, quietly = TRUE)
if(!require(lattice, quietly = TRUE)){
  cat("\n, The **lattice** package must be installed for this vignette.")
}
if(!require(stripless, quietly = TRUE)){
  cat("\n, The **stripless** package must be installed for this vignette.")
}

## ----reorder_barley------------------------------------------------------
barley[,-1] <- lapply(barley[,-1],function(x)reorder(x,barley$yield,median))

## ---- fig.height=10, fig.width = 5---------------------------------------
dotplot(variety~yield|year*site,data=barley,
        col = "darkblue",
        scales = list(alter = 1),
        as.table = TRUE)

## ----barley.1, fig.height=10, fig.width = 5------------------------------

strucplot(variety~ yield|year*site,data=barley, horizontal=TRUE,
        panel=panel.dotplot, 
        col = "darkblue",
        scales = list(alternat = 1),
        spacings = list(x=0, y=.5))


## ----fig.height=10, fig.width = 5,fig.align = 'center'-------------------

strucplot(variety~yield|year*site,data=barley, horizontal = TRUE,
          panel=panel.bars,
          scales = list(alter = 1),
          spacings = list(x=0, y = .5))

## ---- echo = FALSE,message= FALSE----------------------------------------
if(!require(faraway, quietly = TRUE)){
  cat("\n, The **faraway** package must be installed to run",
  "subsequent examples in this vignette.\n",sep = "")
}

## ------------------------------------------------------------------------
hsb$score <- rowSums(hsb[,7:11])
hsb[,c(2,3,5,6)] <-lapply(hsb[,c(2,3,5,6)],reorder,hsb$score,median)
hsb$ses <- factor(hsb$ses,levels = c("low","middle","high"))

## ----  fig.height = 6, fig.width = 6-------------------------------------
hsbprog <- strucplot(prog~score|gender*race*ses*schtyp,data=hsb,
          main = "High School Program Choice",
          panel= panel.dotplot,
          horizontal = TRUE, cex=.5,
          col = "darkblue", 
          scales = list(alternat = 1),
          xyLay= list(x=c(1,3), y = c(4,2)))
plot(hsbprog)

## ----fig.height=6, fig.width = 6,fig.align = 'center'--------------------
dotplot(prog~score|gender*ses*schtyp*race,data=hsb,
        main = "High School Program Choice",
        layout = c(6,8),
        col = "darkblue",
        scales = list(alter = 1),
        as.table = TRUE)

## ---- fig.height = 7, fig.width = 6--------------------------------------
print (hsbprog,legendLoc = "t", 
       cex.font = .7,
       head = c("Left-Right","Up-Down"),
       abbrev = list(race=c(0,4), schtyp = c(0,4)))

## ---- fig.height=4, fig.width = 6,fig.align = 'center'-------------------

barley <- within(barley,{changed_year <- year
    changed_year[site=="Morris" & year == 1932] <- 1931
    changed_year[site=="Morris" & year == 1931] <- 1932}
)
barleyFit <- lm(yield ~ variety + site + changed_year, data=barley)

strucplot(barleyFit, pch=16, col = "darkblue",
         panel= function(...){panel.grid(h=3,v=0); panel.xyplot(...)} )

## ---- fig.height=6, fig.width = 4,fig.align = 'center'-------------------
strucplot(barleyFit, pch=16, col = "darkblue",
          xyLayout = list(y = 2),
         panel= panel.bars )

## ----fig.height=10, fig.width = 5,fig.align = 'center'-------------------

strucplot(variety~ fitted(barleyFit)|changed_year*site,data=barley, horizontal=TRUE,
        panel=panel.dotplot,
        col = "darkblue",
        scales = list(alternat = 1),
        spacings = list(x=0, y=.5))

## ---- fig.height=5, fig.width = 5,fig.align = 'center'-------------------
## A 7 factor 12 run PB design matrix (using first 7 columns of PB 12 matrix)
pb12 <- matrix(1, nrow=12,ncol=11,dimnames = list(NULL,LETTERS[1:11]))
pb12[1,]<- c(-1,1,-1,rep(1,3),rep(-1,3),1,-1)
for(i in 1:10)pb12[i+1,] <- c(pb12[i,11],pb12[i,-11])
pbex <- data.frame(pb12[,1:7])

## A 7 factor 16 run ff of Resolution IV
ffex<- expand.grid(rep(list(c(-1,1)),4))
names(ffex) <- LETTERS[1:4]
ffex <- within(ffex,{G <- A*B*C; F <- B*C*D; E <- A*B*D})

strucplot(pbex)
strucplot(ffex)

## ---- fig.height = 5, fig.width = 5--------------------------------------
  pbex <- rbind(pbex,c(0, rep(c(-.5,.5),3)))
  strucplot(pbex, center = TRUE)

## ---- fig.show = "hide"--------------------------------------------------
  strucplot(~Strength|., data = weldstrength, panel = panel.bars,
  main = "Full Weldstrength Design")


## ------------------------------------------------------------------------
  round(coef(lm(Strength~., data = weldstrength)),2)

## ---- fig.width = 6, fig.height = 5--------------------------------------
  strucplot(~Strength|Rods*Drying*Material*Opening*Preheating, xyLay = c(1,4,5),
  data = weldstrength, panel= panel.bars,
  main = "Weldstrength Results for the 5 Largest Effects")

## ---- fig.width = 5, fig.height = 5--------------------------------------
strucplot(sono[,-c(1,8)],
        groups=sono$Flask, 
        col=c("red","blue"),
        main = "sono design, colored by Flask (red = down)"
  )

## ---- fig.width = 6, fig.height = 5--------------------------------------
strucplot(Intensity~Molarity|Solute*pH*Gas*Water*Horn, groups =Flask, 
          data = sono,
          panel=panel.superpose,
          par.settings = list(superpose.polygon = list(col=c("red","blue"))),
          fill = c("red","blue"),
          auto.key = list(points=FALSE,rectangles=TRUE, 
              title = "Flask",lines.title =1.5, border =TRUE,cex.title = 1.5),
          panel.groups = function(x,y,fill,...) panel.bars(x=x,y=y,col=fill))

## ---- fig.width = 4, fig.height = 4--------------------------------------
  strucplot(~Intensity|Molarity*Solute*pH*Flask, data = sono,
            panel=panel.bars
  )

## ---- fig.width = 4, fig.height = 4--------------------------------------
strucplot(~Intensity|Molarity*Solute*pH, data = sono, panel=panel.bars)

## ----fig.width = 6, fig.height = 6---------------------------------------
## Create a data frame with 4 factors, 2 at 3 levels each and 2 and 2 levels each, 
## with 200 random beta(4,4) responses for each of the 36 settings

##Set a random seed for reproducibility and generate the data
set.seed(2222)
d <- data.frame(x=rbeta(7200,4,4),
    expand.grid(a= 0:1, b= 1:3, c=letters[1:3], d = c("A","B"))[rep(1:36,e=200),])
                                        
## Construct the display
strucplot(x~x|.,data = d, ylim = c(0,3.2), ylab = "Density",
      col= "lightblue", col.line = "red",lwd=2,
      panel = function(x,y,col, col.line, ...){
      panel.histogram(x, col=col,breaks=NULL, ...)
      panel.densityplot(x, plot.points= FALSE,col= col.line,... )
       }
)

