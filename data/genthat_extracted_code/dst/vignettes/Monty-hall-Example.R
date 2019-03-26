## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(dst)
# Evidence for sun
Weather <-  bca(f= matrix(c(1,0,0,1,1,1), ncol=2, byrow=TRUE), m= c(0, 0.45, 0.55), cnames =c("Sun", "NoSun"), infovarnames = "Weather", varnb = 1)
Weather
# and now the belief function
tabresul(Weather)

## ------------------------------------------------------------------------
plautrans(Weather)

## ------------------------------------------------------------------------
# 1. define the tt matrix MHABC_tt, which encodes the subset S
# 
MHABC_tt <- matrix(c(1,0,0,0,1,0,0,0,1,
                     1,0,0,0,0,1,0,1,0,
                     0,1,0,1,0,0,0,0,1,
                     0,1,0,0,0,1,1,0,0,
                     0,0,1,1,0,0,0,1,0,
                     0,0,1,0,1,0,1,0,0), ncol=9, byrow=TRUE)
colnames(MHABC_tt) <- rep(c("car", "g1", "g2"), 3)
#
# 2. define the spec matrix. 
# Here we have one subset of six elements
# 
MHABC_spec = matrix(rep(1,12), ncol = 2, dimnames = list(NULL, c("specnb", "mass"))) 
# 
# 3. define the info matrix. 
# for each variable, we attribute a number and give the size of the frame
# 
MHABC_info =matrix(c(1:3, rep(3,3)), ncol = 2, dimnames = list(NULL, c("varnb", "size")) )
# 
# 4. call of the function with the name of the variables and the numbering of the relation
# 
MHABC_rel <-  bcaRel(tt = MHABC_tt, spec = MHABC_spec, infovar = MHABC_info, infovarnames = c("MHA", "MHB", "MHC"), relnb = 1)
# 
# let's see some results:
# Note that row labels of the resulting tt matrix can become pretty long. If the case, we can use the prmatrix function, for example:
prmatrix(t(MHABC_rel$tt), collab = "")
# Another way to check the tt matrix is:
which(MHABC_rel$tt[1,] == TRUE)

## ------------------------------------------------------------------------
# Evidence for door A
MHA_E <-  bca(f= diag(1,3,3), m= rep(1/3, 3), cnames =c("car", "goat1", "goat2"), infovarnames = "MHA", varnb = 1)
MHA_E
# At this point, no big deal...
tabresul(MHA_E)

## ------------------------------------------------------------------------
# Evidence for door B
MHB_E <- bca(f= matrix(c(0,1,1), ncol=3, byrow = TRUE), m=1, cnames =c("car", "goat1", "goat2"), infovarnames = "MHB" , varnb=2)
MHB_E

## ---- fig.show='hold', fig_caption: yes----------------------------------
# The network
if (requireNamespace("igraph", quietly = TRUE) ) {
library(igraph)
# Encode pieces of evidence and relations with an incidence matrix
Monty_hgm <- matrix(c(1,1,1,1,0,0,0,1,0), ncol=3, dimnames = list(c("A", "B", "C"), c("r_ABC", "ev_A", "ev_B")))
# The graph structure
Monty_hg <- graph_from_incidence_matrix(incidence = Monty_hgm, directed = FALSE, multiple = FALSE, weighted = NULL,add.names = NULL)
V(Monty_hg)
# Show variables as circles, relations and evidence as rectangles
V(Monty_hg)$shape <- c("circle", "crectangle")[V(Monty_hg)$type+1]
V(Monty_hg)$label.cex <- 0.6
V(Monty_hg)$label.font <- 2
# render graph
plot(Monty_hg, vertex.label = V(Monty_hg)$name, vertex.size=(4+4*V(Monty_hg)$type)*8)
}

## ------------------------------------------------------------------------
# Extend MHA to the product space AxBxC
MHA_ext <- extmin(MHA_E, MHABC_rel )
# Combine MHA_ext and MHABC_rel
MHA_ABC_comb <- dsrwon(MHA_ext,MHABC_rel)
MHA_ABC_comb$con
# Eliminate variable A ( since  the measure of contradiction is 0, no need to normalize)
MHBC <- elim(MHA_ABC_comb, xnb = 1)

## ------------------------------------------------------------------------
Monty2_hgm <- matrix(c(1,1,1,0), ncol=2, dimnames = list(c("B", "C"), c("r_BC", "ev_B")))
Monty2_hg <- graph_from_incidence_matrix(incidence = Monty2_hgm, directed = FALSE, multiple = FALSE, weighted = NULL,add.names = NULL)
V(Monty2_hg)
# Variables as circles, relations and evidence as rectangles
V(Monty2_hg)$shape <- c("circle","crectangle")[V(Monty2_hg)$type+1]
V(Monty2_hg)$label.cex <- 0.6
V(Monty2_hg)$label.font <- 2
# render graph
# plot(Monty_hg, vertex.size=40)
plot(Monty2_hg, vertex.label = V(Monty2_hg)$name, vertex.size=(4+4*V(Monty2_hg)$type)*8)

## ------------------------------------------------------------------------
# Extend MHB_E to the space BxC
MHB_ext <- extmin(MHB_E, MHBC )
MHB_BC_comb <- dsrwon(MHB_ext, MHBC)
MHB_BC_comb$con
# Eliminate variable B (since  MHA_BC_comb$con = 0, no need to normalize)
MHC <- elim(MHB_BC_comb, xnb = 2)
belplau(MHC)

## ------------------------------------------------------------------------
MHC_plus_singl <- addTobca(MHC, f=matrix(c(0,1,0,0,0,1), ncol = 3, byrow = TRUE))
tabresul(MHC_plus_singl)

