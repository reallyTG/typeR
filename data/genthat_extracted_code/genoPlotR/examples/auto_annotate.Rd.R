library(genoPlotR)


### Name: auto_annotate
### Title: Auto-annotate dna_segs
### Aliases: auto_annotate
### Keywords: data

### ** Examples

## Prepare dna_seg
names <- paste("Eco", sprintf("%04d", 1:20), sep="")
gene <- c("-", "atpC", "atpB", "atpA", "atp2", 
          "-", "-", "cda1", "cda2", "cda3",
          "vcx23", "vcx22", "vcx21", "cde20",
          "-", "gfrU", "gfrT", "gfrY", "gfrX", "gfrW")
ds <- dna_seg(data.frame(name=names, start=(1:20)*3, end=(1:20)*3+2,
                         strand=rep(1, 20), gene=gene,
                         stringsAsFactors=FALSE))
## Original annotation
annot1 <- annotation(x1=middle(ds), text=ds$gene, rot=30)
## auto_annotate with various options
annot2 <- auto_annotate(ds)
annot3 <- auto_annotate(ds, keep_genes_only=FALSE, rot=45)
annot4 <- auto_annotate(ds, keep_genes_only=FALSE,
                        locus_tag_pattern="Eco", col="red")
## Plot
plot_gene_map(list(ds, ds, ds, ds),
              annotations=list(annot1, annot2, annot3, annot4))




