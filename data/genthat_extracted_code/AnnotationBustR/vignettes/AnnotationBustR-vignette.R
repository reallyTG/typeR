## ---- out.width = "100%", echo=FALSE,fig.align='left',fig.cap= "Fig. 1: AnnotationBustR Workflow. Steps in orange occur outside the package while steps in blue are core parts of AnnotationBustR and steps in green represent optional steps"----
knitr::include_graphics("workflow.jpg")

## ---- out.width = "100%", echo=FALSE, fig.align='left',fig.cap= "Fig. 2: GenBank features annotation for accession G295784.1 that contains ATP8 and ATP6. The words highlighted in yellow would fall under the column of Type. Here they are both CDS. The type of sequence is always listed farthest to the left in the features table. Colors in blue indicate terms that would be placed in the Name column, here indicating that the two CDS in this example are ATP8, labeled as ATPase8 and ATP6 respectively."----
knitr::include_graphics("featuresMarked.jpg")

## ---- echo=FALSE---------------------------------------------------------
ex.frame<-rbind(c("ATP8","CDS","ATPase8"),c("ATP6","CDS","ATPase6"))
colnames(ex.frame)<-c("Locus","Type","Name")
ex.frame<-as.data.frame(ex.frame)
print(ex.frame)

