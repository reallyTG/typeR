## ----setup, echo=FALSE, results="hide"--------------------------------------------------
library("knitr")
opts_chunk$set(fig.align="center", fig.width=6, fig.height=6)
options(width=90)

## ----saturated--------------------------------------------------------------------------
library(maps)
#library(mapproj)
#nv <- map('county', 'nevada', fill=TRUE, col=1:12, projection="mollweide")
reds <- c("nevada,carson city", "nevada,churchill", "nevada,clark",      
          "nevada,douglas", "nevada,esmeralda", "nevada,lincoln",    
          "nevada,nye", "nevada,storey", "nevada,white pine")
grns <- c("nevada,elko", "nevada,eureka", "nevada,humboldt", "nevada,lander",
          "nevada,lyon", "nevada,mineral", "nevada,pershing", "nevada,washoe")
nv.names <- c(reds,grns)

# Draw the map and color it
nv.names <- map('county', 'nevada', namesonly=TRUE, plot=FALSE)

# Green/Red
op <- par(mar=c(0,1,0,1), mfrow=c(1,2))
nv <- map('county', 'nevada', fill=TRUE,
          col=ifelse(nv.names %in% reds,
            rgb(206, 60, 17, max=255), rgb(80,164,52, max=255)),
          projection="mollweide")
# Red/Green
nv <- map('county', 'nevada', fill=TRUE,
          col=ifelse(nv.names %in% reds,
            rgb(80,164,52, max=255), rgb(206, 60, 17, max=255)),
          projection="mollweide")
par(op)

## ----areas------------------------------------------------------------------------------
# Area of red region = 55581
sum(area.map(nv, regions=reds))
# Area of green region = 55687
sum(area.map(nv, regions=grns))


## ----muted------------------------------------------------------------------------------
op <- par(mar=c(0,1,0,1))
nv <- map('county', 'nevada', fill=TRUE,
          col=ifelse(nv.names %in% reds,
                     rgb(250, 229, 139, max=255), rgb(204, 246, 186, max=255)),
          projection="mollweide")
par(op)

