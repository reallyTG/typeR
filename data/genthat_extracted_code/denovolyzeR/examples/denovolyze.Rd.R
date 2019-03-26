library(denovolyzeR)


### Name: denovolyze
### Title: Evaluates burden of _de novo_ variation against expectation
### Aliases: denovolyze denovolyzeByClass denovolyzeByGene

### ** Examples


### denovolyze

denovolyze(genes=autismDeNovos$gene,
           classes=autismDeNovos$class,
           nsamples=1078)

### denovolyzeByClass

denovolyzeByClass(genes=autismDeNovos$gene,
                  classes=autismDeNovos$class,
                  nsamples=1078)

# this convenience function is identical to:

denovolyze(genes=autismDeNovos$gene,
           classes=autismDeNovos$class,
           nsamples=1078,
           groupBy="class",
           includeClasses=c("syn","mis","lof","prot","all"),
           includeGenes="all"
           )

### denovolyzeByGene

denovolyzeByGene(genes=autismDeNovos$gene,
                 classes=autismDeNovos$class,
                 nsamples=1078)

# this is identical to:

denovolyze(genes=autismDeNovos$gene,
           classes=autismDeNovos$class,
           nsamples=1078,
           groupBy="gene",
           includeClasses=c("lof","prot"),
           includeGenes="all"
           )




