## ----libraries, cache = FALSE, echo = FALSE, message = FALSE, warning = FALSE----
require(PPforest)
require(dplyr)
require(RColorBrewer)
require(GGally)
require(gridExtra)
require(PPtreeViz)
library(ggplot2)
library(knitr)
set.seed(310756) #reproducibility

## ----hooks, echo = FALSE-------------------------------------------------

knitr::opts_chunk$set(message = FALSE, warning = FALSE, cache = TRUE, autodep=TRUE, cache.lazy=FALSE )
opts_knit$set(eval.after = 'fig.cap')
theme_set(theme_bw(base_family="serif"))

## ----descri, fig.align="center", fig.cap=capmatrix,  fig.show='hold', fig.height = 5, fig.width = 5, echo=FALSE----

a <- GGally::ggpairs(PPforest::crab,
    columns = 2:6,
    ggplot2::aes(colour = Type, alpha=.1),
    lower = list(continuous = 'points'),
    axisLabels='none',
    upper=list(continuous='blank')
     , legend = NULL)

capmatrix<-"Scatter plot matrix of crab data "
a

## ----ppsplit-------------------------------------------------------------
Tree.crab <- PPforest::PPtree_split("Type~.", data = crab, PPmethod = "LDA", size.p = 0.6)
 Tree.crab

## ----ppf-----------------------------------------------------------------

pprf.crab <- PPforest::PPforest(data = crab, class = "Type", size.tr = .8, m = 200,
                                size.p =  .5,  PPmethod = 'LDA',  parallel =FALSE, cores = 2)

pprf.crab

## ----ppstr---------------------------------------------------------------
str(pprf.crab, max.level = 1 )

## ----predtest------------------------------------------------------------
pprf.crab$prediction.test

## ----impo1---------------------------------------------------------------
impo1 <- permute_importance(pprf.crab)
impo1

## ----figimp1, fig.align="center", fig.cap=capimp1,echo=FALSE-------------
ggplot(impo1, aes(x = imp, y = nm) ) + geom_point()
capimp1 <- "Permuted importance variable"

## ----impo2---------------------------------------------------------------

impo2 <-  ppf_avg_imp(pprf.crab, "Type")
impo2


## ----figimp2, fig.align="center",  fig.cap=capimp2,echo=FALSE------------
 ggplot(impo2, aes(x = mean, y = variable) ) + geom_point() 
capimp2<- "Average importance variable"

## ----impo3---------------------------------------------------------------
impo3 <- ppf_global_imp(data = crab, class = "Type", pprf.crab)
impo3

## ----figimp3, fig.align = "center",  fig.cap = capimp3, echo = FALSE-----
ggplot(impo3, aes(x = mean, y = variable) ) + geom_point()
capimp3 <- "Global importance variable"

## ----parallel, , fig.align="center", fig.cap= capar, fig.show = 'hold',fig.width = 7 ,fig.height = 4, warning = FALSE, echo = FALSE----
parallel <- function(ppf){
myscale <- function(x) (x - mean(x)) / sd(x)

scale.dat <- ppf$train %>% dplyr::mutate_at(dplyr::vars(-matches(ppf$class.var)), dplyr::funs(myscale))
scale.dat.melt <- scale.dat %>%  dplyr::mutate(ids = 1:nrow(ppf$train)) %>% tidyr::gather(var,Value,-Type,-ids)
scale.dat.melt$Variables <- as.numeric(as.factor(scale.dat.melt$var))
colnames(scale.dat.melt)[1] <- "Class"

ggplot2::ggplot(scale.dat.melt, ggplot2::aes(x = Variables, y = Value,
                           group = ids, key = ids, colour = Class, var = var)) +
  ggplot2::geom_line(alpha = 0.3) + ggplot2::scale_x_discrete(limits = levels(as.factor(scale.dat.melt$var)), expand = c(0.01,0.01)) +
  ggplot2::ggtitle("Data parallel plot ") + ggplot2::theme(legend.position = "none", axis.text.x  = element_text(angle = 90, vjust = 0.5)) +
  ggplot2::scale_colour_brewer(type = "qual", palette = "Dark2")


}

capar <-"Parallel coordinate plot of crab data"
 parallel(pprf.crab)

## ----mds, , fig.align="center",fig.cap= capmds, fig.show='hold',fig.width = 5 ,fig.height = 4, warning=FALSE, echo=FALSE----

mdspl2d <- function(ppf, lege = "bottom", siz = 3, k = 2) {

  d <- diag(nrow(ppf$train))
  d <- as.dist(d + 1 - ppf$proximity)
  rf.mds <- stats::cmdscale(d, eig = TRUE,  k = k)
  colnames(rf.mds$points) <- paste("MDS", 1:k, sep = "")


  df <- data.frame(Class = ppf$train[, 1], rf.mds$points)

  mds <- ggplot2::ggplot(data = df) +
   ggplot2::geom_point(ggplot2::aes(x = MDS1, y = MDS2, color = Class),
              size = I(siz), alpha = .5) +
   ggplot2::scale_colour_brewer(type = "qual", palette = "Dark2", name = "Type") +
   ggplot2::theme(legend.position = lege, aspect.ratio = 1)

  mds
}
capmds<- "Multidimensional scaling plot to examine similarities between cases"
  
mdspl2d(ppf = pprf.crab)

## ----side, fig.align="center", fig.cap= capside, fig.show='hold',fig.width = 5 ,fig.height = 5, warning = FALSE, echo=FALSE----
side <-  function(ppf, ang = 0, lege = "bottom", siz = 3,
                  ttl = "") {
  voteinf <- data.frame(ids = 1:length(ppf$train[, 1]), Type = ppf$train[, 1],
                      ppf$votes, pred = ppf$prediction.oob ) %>%
  tidyr::gather(Class, Probability, -pred, -ids, -Type)

  ggplot2::ggplot(data = voteinf, ggplot2::aes(Class, Probability, color = Type)) +
    ggplot2::geom_jitter(height = 0, size = I(siz), alpha = .5) +
    ggtitle(ttl) +
    ylab("Proportion") +
    ggplot2::scale_colour_brewer(type = "qual", palette = "Dark2") +
    ggplot2::theme(legend.position = lege, legend.text = ggplot2::element_text(angle = ang)) +
    ggplot2::labs(colour = "Class")
}
capside <-"Vote matrix representation by a jittered side-by-side dotplot. Each dotplot shows the proportion of times the case was predicted into the group, with 1 indicating that the case was always predicted to the group and 0 being never."
 side(pprf.crab) 

## ----ternary, fig.align = "center",fig.cap = capter, fig.show = 'hold',fig.width = 7 ,fig.height = 4, warning = FALSE, echo=FALSE----
 pl_ter <- function(dat, dx, dy ){ 
 p1  <- dat[[1]] %>% dplyr::filter(pair %in% paste(dx, dy, sep = "-") ) %>% 
   dplyr::select(Class, x, y) %>% 
   ggplot2::ggplot(aes(x, y, color = Class)) + 
   ggplot2::geom_segment(data = dat[[2]], aes(x = x1, xend = x2, 
                                y = y1, yend = y2), color = "black" ) + 
   ggplot2::geom_point(size = I(3), alpha = .5) + 
   ggplot2::labs(y = " ",  x = " ") + 
   ggplot2::theme(legend.position = "none", aspect.ratio = 1) + 
   ggplot2::scale_colour_brewer(type = "qual", palette = "Dark2") + 
   ggplot2::labs(x = paste0("T", dx, ""), y = paste0("T", dy, " ")) + 
   ggplot2::theme(aspect.ratio = 1) 

 p1 
 } 

p1 <-  pl_ter(ternary_str(pprf.crab, id = c(1, 2, 3), sp = 3, dx = 1, dy = 2), 1, 2 ) 
p2 <-  pl_ter(ternary_str(pprf.crab, id = c(1, 2, 3), sp = 3, dx = 1, dy = 3), 1, 3) 
p3 <-  pl_ter(ternary_str(pprf.crab, id = c(1, 2, 3), sp = 3, dx = 2, dy = 3), 2, 3) 

gridExtra::grid.arrange(p1, p2, p3, ncol = 3) 

capter <- "Generalized ternary plot representation of the vote matrix for four classes. The tetrahedron is shown pairwise. Each point corresponds to one observation and color is the true class."

