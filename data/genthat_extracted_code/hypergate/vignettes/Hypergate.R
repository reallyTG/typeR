## ----global_options, include=FALSE---------------------------------------
knitr::opts_chunk$set(fig.pos = 'H',tidy.opts=list(width.cutoff=60),tidy=TRUE,fig.path="fig/")

## ---- include=FALSE------------------------------------------------------
options("warn"=-1)

## ---- eval=FALSE---------------------------------------------------------
#  install.packages(c("sp","polyclip","rgeos"))
#  source("https://bioconductor.org/biocLite.R")
#  biocLite("flowCore")

## ---- eval=FALSE---------------------------------------------------------
#  install.packages("devtools")
#  library(devtools)
#  install_github(repo="ebecht/hypergate")

## ---- echo = TRUE, message = FALSE---------------------------------------
library(hypergate)

## ---- echo= TRUE---------------------------------------------------------
data(Samusik_01_subset,package="hypergate")

## ---- eval = FALSE-------------------------------------------------------
#  g=gate_from_biplot(
#  	Samusik_01_subset$tsne,
#  	"tSNE1",
#  	"tSNE2"
#  )		

## ---- echo=TRUE, fig.cap="Manual selection of a cluster on a 2D t-SNE"----
x=c(12.54,8.08,7.12,12.12,17.32,20.62,21.04,20.83,18.07,15.20)
y=c(-10.61,-14.76,-18.55,-20.33,-21.16,-19.74,-14.40,-11.08,-10.02,-9.42)
pol=list(x=x,y=y)
library("sp")
gate_vector=sp::point.in.polygon(Samusik_01_subset$tsne[,1],Samusik_01_subset$tsne[,2],pol$x,pol$y)
plot(Samusik_01_subset$tsne,pch=16,cex=0.5,col=ifelse(gate_vector==1,"firebrick3","lightsteelblue"))
polygon(pol,lty=2)

## ---- eval=FALSE---------------------------------------------------------
#  require(Rphenograph)
#  set.seed(5881215)
#  clustering=Rphenograph(Samusik_01_subset$xp_src[,Samusik_01_subset$regular_channels])
#  cluster_labels=membership(clustering[[2]])

## ------------------------------------------------------------------------
set.seed(5881215)
cluster_labels=kmeans(Samusik_01_subset$tsne,20,nstart=100)$cluster

## ---- fig.cap="Selection of a cluster from a clustering algorithm output"----
plot(Samusik_01_subset$tsne,col=ifelse(cluster_labels==20,"firebrick3","lightsteelblue"),pch=16,cex=0.5)

## ------------------------------------------------------------------------
hg_output=hypergate(
	xp=Samusik_01_subset$xp_src[,Samusik_01_subset$regular_channels],
	gate_vector=gate_vector,
	level=1,
	verbose=FALSE
)

## ------------------------------------------------------------------------
gating_predicted=subset_matrix_hg(hg_output,Samusik_01_subset$xp_src[,Samusik_01_subset$regular_channels])

## ---- eval=FALSE---------------------------------------------------------
#  table(ifelse(gating_predicted,"Gated-in","Gated-out"),ifelse(gate_vector==1,"Events of interest","Others"))

## ---- echo=FALSE---------------------------------------------------------
knitr::kable(table(ifelse(gating_predicted,"Gated-in","Gated-out"),ifelse(gate_vector==1,"Events of interest","Others")))

## ------------------------------------------------------------------------
bm=boolmat(
	gate=hg_output,
	xp=Samusik_01_subset$xp_src[,Samusik_01_subset$regular_channels]
)
head(bm)

## ---- echo=FALSE---------------------------------------------------------
knitr::kable(table(ifelse(bm[,"SiglecF_min"],"SiglecF above threshold","Gated-out because of SiglecF"),ifelse(gate_vector==1,"Events of interest","Others")))

## ----echo=TRUE,fig.width=3.5,fig.height=3.5,fig.cap="Gating strategy"----
plot_gating_strategy(
	gate=hg_output,
	xp=Samusik_01_subset$xp_src[,Samusik_01_subset$regular_channels],
	gate_vector=gate_vector,
	level=1,
	highlight="firebrick3"
)

## ----fig.cap="F1-score obtained during optimization when adding parameters"----
f_values_vs_number_of_parameters=c(
	F_beta(rep(TRUE,nrow(Samusik_01_subset$xp_src)),gate_vector==1),
	hg_output$f[c(apply(hg_output$pars.history[,hg_output$active_channels],2,function(x)min(which(x!=x[1])))-1,nrow(hg_output$pars.history))][-1]
)
barplot(rev(f_values_vs_number_of_parameters),names.arg=rev(c("Initialization",paste("+ ",sep="",hg_output$active_channels))),las=3,mar=c(10,4,1,1),horiz=TRUE,xlab="Cumulative F1-score")

## ---- fig.cap="Contribution of each parameter to the output"-------------
contributions=channels_contributions(
	gate=hg_output,
	xp=Samusik_01_subset$xp_src[,Samusik_01_subset$regular_channels],
	gate_vector=gate_vector,
	level=1,
	beta=1
)		
barplot(contributions,las=3,mar=c(10,4,1,1),horiz=TRUE,xlab="F1-score deterioration when the parameter is ignored")

## ------------------------------------------------------------------------
hg_output_polished=reoptimize_strategy(
	gate=hg_output,
	channels_subset=c("SiglecF_min","cKit_max"),
	xp=Samusik_01_subset$xp_src[,Samusik_01_subset$regular_channels],
	gate_vector=gate_vector,
	level=1
)

## ----echo=TRUE,fig.width=3.5,fig.height=3.5, fig.cap="Final output"------
plot_gating_strategy(
	gate=hg_output_polished,
	xp=Samusik_01_subset$xp_src[,Samusik_01_subset$regular_channels],
	gate_vector=gate_vector,
	level=1,
	highlight="firebrick3"
)

## ------------------------------------------------------------------------
hgate_pheno(hg_output)
hgate_rule(hg_output)
hgate_info(hg_output)
# Fscores can be retrieved when the same parameters given to hypergate() are given to hgate_info():
hg_out_info = hgate_info(hg_output,
	xp=Samusik_01_subset$xp_src[,Samusik_01_subset$regular_channels],
	gate_vector=gate_vector,
	level=1)
hg_out_info
# and formatted readily
paste0(hg_out_info[,"Fscore"], collapse = ", ")

## ------------------------------------------------------------------------
set.seed(123) ## Makes the subsampling reproducible
gate_vector=Samusik_01_subset$labels
subsample=hgate_sample(gate_vector=gate_vector,level=5,size=100) ## Subsample 100 events from population #5 (Classical monocytes), and a corresponding number of negative events
tab=table(ifelse(subsample,"In","Out"),ifelse(Samusik_01_subset$labels==5,"Positive pop.","Negative pop."))
tab[1,]/colSums(tab) ## Fraction of subsampled events for positive and negative populations
xp=Samusik_01_subset$xp_src[,Samusik_01_subset$regular_channels]
hg=hypergate(xp=xp[subsample,],gate_vector=gate_vector[subsample],level=5) ## Runs hypergate on a subsample of the input matrix
gating_heldout=subset_matrix_hg(hg,xp[!subsample,]) ## Applies the gate to the held-out data
table(ifelse(gating_heldout,"Gated in","Gated out"),ifelse(Samusik_01_subset$labels[!subsample]==5,"Positive pop.","Negative pop."))

