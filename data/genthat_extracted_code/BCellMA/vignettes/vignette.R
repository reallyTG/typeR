## ---- fig.show='hold'----------------------------------------------------
# Load required packages
library("BCellMA")

## ---- echo=TRUE, results='asis'------------------------------------------
# Subset example data
data("IMGTtab1")
data("IMGTtab2")
data("IMGTtab7")
data("IMGTtab8")

## ---- echo=TRUE, results='asis', fig.height=4, fig.width=6---------------

bm_proband<- nucleotide_mutation(IMGTtab8[,11:22])


## ---- echo=TRUE, results='markup'----------------------------------------

germline<-germlineReconstr(IMGTtab2$V_REGION, IMGTtab7$V_REGION)


## ---- echo=TRUE----------------------------------------------------------

na_funktion(germline)


## ---- echo=TRUE, results='markup'----------------------------------------
data<-targetingMatrix(data_tab2=IMGTtab2, data_tab_germline=germline, data_tab7=IMGTtab7)

data$mutzur_A

## ---- echo=TRUE, results='markup'----------------------------------------
targeting_motiv_data<-targeting_motiv(data)

targeting_motiv_data$A

## ---- echo=TRUE, results = 'axis', fig.width=6, fig.height=5-------------

targeting_motive_plot(targeting_motiv_data$A, xfontsize = 15, yfontsize = 15, xlim=20 )

grid.text("func. IGHV: A -> N.", x=0.55, y=unit(20,"lines"),
          gp=gpar(fontsize=14))

## ---- echo=TRUE, results='markup'----------------------------------------

Regions<-cbind(IMGTtab7$FR1_IMGT,
               IMGTtab7$CDR1_IMGT,
               IMGTtab7$FR2_IMGT,
               IMGTtab7$CDR2_IMGT,
               IMGTtab7$FR3_IMGT,
               IMGTtab7$CDR3_IMGT)
Regions_matrix<-aa_dist(data=Regions)
Regions_matrix[1:3,1:17]


## ---- echo=T, results='hide', warning=FALSE, fig.height=4, fig.keep='none'----

data(Klassen)
p1<-aa_plot(Regions_matrix, "Amino acid Distribution", "right", Klassen)

## ---- echo=F, results='hold', warning=FALSE, fig.width=6, fig.height=4----

p1


## ----echo=TRUE, warning=FALSE, fig.height=6------------------------------

CDRs<-cbind(IMGTtab7$CDR1_IMGT,
               IMGTtab7$CDR2_IMGT,
               IMGTtab7$CDR3_IMGT)
CDRs_matrix<-aa_dist(data=Regions)


## ---- echo=T, results='hide', warning=FALSE, fig.width=6, fig.keep='none'----


p2<-aa_plot(CDRs_matrix, "Amino acid Distribution", "right", Klassen)


## ---- echo=F, results='hold', warning=FALSE, fig.width=6, fig.height=4----

p2


## ---- echo=TRUE, warning=FALSE, fig.height=4-----------------------------

cdr3_matrix<-aa_cdr3_dist(data=IMGTtab7$CDR3_IMGT)


## ---- echo=T, results='hide', warning=FALSE, fig.height=6, fig.keep='none'----


p3<-aa_plot(cdr3_matrix, "Amino acid Distribution", "right", Klassen)


## ---- echo=F, results='hold', warning=FALSE, fig.width=6, fig.height=4----

p3


## ---- echo=TRUE, warning=FALSE, fig.height=4-----------------------------

gane_comb<-gene_comb_funk(family1 = IMGTtab1$V_GENE_and_allele,
                          family2 = IMGTtab1$J_GENE_and_allele)
gane_comb


## ---- echo=TRUE, warning=FALSE, fig.width=6, fig.height=4----------------

gene_comb_plot(gane_comb, "IGHV and IGHJ ratio", legend_position = "right", a = 35, b = 0.5)

## ---- echo=TRUE, warning=FALSE, fig.width=6, fig.height=4----------------

lenght_tab<-lengthCDR3(as.numeric(IMGTtab1$CDR3_IMGT_length))
lenght_tab

