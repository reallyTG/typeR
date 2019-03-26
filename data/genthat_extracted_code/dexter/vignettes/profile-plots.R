## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = FALSE)
library(dexter)
library(latticeExtra)
fq = c(10,12,30,20,40,24,15,18,14)
fq=matrix(fq,3,3)
attr(fq,"dimnames")=list(c(0,1,2),c(0,1,2))
den = matrix(c(10,32,85,32,85,42,85,42,14),3,3)

blues=function (n, h = 221, c. = c(80, 0), l = c(30, 90), power = 1.5, 
          fixup = TRUE, gamma = NULL, alpha = 1, ...) 
{
  if (!is.null(gamma)) 
    warning("'gamma' is deprecated and has no effect")
  if (n < 1L) 
    return(character(0L))
  c <- rep(c., length.out = 2L)
  l <- rep(l, length.out = 2L)
  power <- rep(power, length.out = 2L)
  rval <- seq(1, 0, length = n)
  rval <- colorspace::hex(colorspace::polarLUV(L = l[2L] - diff(l) * rval^power[2L], 
                       C = c[2L] - diff(c) * rval^power[1L], H = h[1L]), fixup = fixup, 
              ...)
  if (!missing(alpha)) {
    alpha <- pmax(pmin(alpha, 1), 0)
    alpha <- format(as.hexmode(round(alpha * 255 + 1e-04)), 
                    width = 2L, upper.case = TRUE)
    rval <- paste(rval, alpha, sep = "")
  }
  return(rval)
}

reds=
function (n, h = 11, c. = c(80, 5), l = c(35, 95), power = 0.6, 
          fixup = TRUE, gamma = NULL, alpha = 1, ...) 
{
  if (!is.null(gamma)) 
    warning("'gamma' is deprecated and has no effect")
  if (n < 1L) 
    return(character(0L))
  c <- rep(c., length.out = 2L)
  l <- rep(l, length.out = 2L)
  power <- rep(power, length.out = 2L)
  rval <- seq(1, 0, length = n)
  rval <- colorspace::hex(colorspace::polarLUV(L = l[2L] - diff(l) * rval^power[2L], 
                       C = c[2L] - diff(c) * rval^power[1L], H = h[1L]), fixup = fixup, 
              ...)
  if (!missing(alpha)) {
    alpha <- pmax(pmin(alpha, 1), 0)
    alpha <- format(as.hexmode(round(alpha * 255 + 1e-04)), 
                    width = 2L, upper.case = TRUE)
    rval <- paste(rval, alpha, sep = "")
  }
  return(rval)
}

## ---- figProf, echo=FALSE, results="hide",fig.height=4,fig.width=4,fig.align='center',message=FALSE----
# fig.align='center' does not work anymore when you specify any css styles
# therefore the: display:block;margin: 0 auto;
db = start_new_project(verbAggrRules, ":memory:", covariates=list(gender="<unknown>"))
add_booklet(db, verbAggrData, "agg")
add_item_properties(db, verbAggrProperties)
profile_plot(db, item_property='mode', covariate='gender', booklet_id=='agg')

## ----frq, echo=FALSE-----------------------------------------------------
rownames(fq) = c(0,1,2)
colnames(fq) = c(0,1,2)
fq

## ---- fig1, echo=FALSE,fig.align='center', out.extra='style="margin-left: -30px; margin-top: -45px;"'----
cloud(fq, panel.3d.cloud = panel.3dbars,
      xbase = 0.4, ybase = 0.4, zlim = c(0, max(fq)),
      scales = list(arrows = FALSE, just = "right"), xlab = "A", ylab = "B",
      col.facet =  "tan",
      zlab='',
      pretty=TRUE,
      par.box = list(lty=0),
      screen = list(z = 40, x = -30))

## ---- fig21, echo=FALSE, out.extra='style="margin-left: -30px; margin-top: -50px;"'----
joint = prop.table(fq)

cloud(joint, panel.3d.cloud = panel.3dbars,
      xbase = 0.4, ybase = 0.4, zlim = c(0, 1),
      scales = list(arrows = FALSE, just = "right"), 
      xlab = "A", ylab = "B", zlab ='',
      pretty=TRUE,
      par.box = list(lty=0),
      col.facet =  "skyblue", alpha.facet=.7,
      screen = list(z = 40, x = -30))

## ---- fig22, echo=FALSE, out.extra='style="margin-left: -30px; margin-top: -50px;"'----

conditional = prop.table(fq,1)
co = rep(c('skyblue1','pink1','springgreen1'),3)

cloud(conditional, panel.3d.cloud = panel.3dbars,
      xbase = 0.4, ybase = 0.4, zlim = c(0, 1),
      scales = list(arrows = FALSE, just = "right"), 
      xlab = "A", ylab = "B", zlab ='',
      pretty=TRUE,
      par.box = list(lty=0),
      col.facet =  co, alpha.facet=.7,
      screen = list(z = 40, x = -30))

## ---- fig3, echo=FALSE,out.extra='style="margin-left: -30px; margin-top: -50px;"'----
special = fq / den
j = 6-c(1,2,3,2,3,4,3,4,5)
pa=blues(5)
sp=pa[j]
cloud(special, panel.3d.cloud = panel.3dbars,
      xbase = 0.4, ybase = 0.4, zlim = c(0, 1),
      scales = list(arrows = FALSE, just = "right"), xlab = "A", ylab = "B",zlab ='',
      pretty=TRUE,
      par.box = list(lty=0),
      col.facet =  sp, alpha.facet=.7,
      screen = list(z = 40, x = -30))

## ---- fig41, echo=FALSE,out.extra='style="margin-left: -30px; margin-top: -50px;"'----
pa=reds(5)
hi = c(1,4,5,6,9)
sp[hi] = pa[j[hi]]

cloud(special, panel.3d.cloud = panel.3dbars,
      xbase = 0.4, ybase = 0.4, zlim = c(0, 1),
      scales = list(arrows = FALSE, just = "right"), xlab = "A", ylab = "B",zlab ='',
      pretty=TRUE,
      par.box = list(lty=0),
      col.facet =  sp, alpha.facet=.7,
      screen = list(z = 40, x = -30))

## ---- fig42, echo=FALSE,out.extra='style="margin-top: -30px;margin-left:0px;"'----
d = expand.grid(0:2,0:2)
plot(d, xlab = "A", ylab = "B", xlim=c(0.5,4), ylim=c(-0.3,2.7), asp=1, pch=15,
     cex=2.5, col=sp, axes=FALSE)
lines(0:1,1:0,col="gray")
lines(1:2,2:1,col="gray")
lines(c(0,2),c(2,0),col="gray")
lines(c(0,0,1,2,2), c(0,1,1,1,2), col=3, lwd=4)
axis(1, at = 0:2,lty=0)
axis(2, at = 0:2,lty=0)


## ---- prof_plot2, echo=FALSE, fig.height=5, fig.width=5, fig.align='center'----
profile_plot(db, item_property='mode', covariate='gender', booklet_id=='agg', main='Gender')
mtext('Do versus Want')

## ---- show=FALSE---------------------------------------------------------
close_project(db)

