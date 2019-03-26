library(bcRep)


### Name: bcRep-package
### Title: Advanced Analysis of B Cell Receptor Repertoire Data
### Aliases: bcRep-package bcRep
### Keywords: package

### ** Examples

## Not run: 
##D data(summarytab)
##D data(aaseqtab)
##D data(aaseqtab2)
##D data(mutationtab)
##D data(clones.ind)
##D data(clones.allind)
##D data(vgenes) 
##D 
##D ## Combine IMGT/HighV-QUEST folders and read data
##D combineIMGT(folders = c("pathTo/IMGT1a", "pathTo/IMGT1b", "pathTo/IMGT1c"), 
##D name = "NewProject)
##D tab<-readIMGT("PathTo/file.txt",filterNoResults=TRUE)
##D 
##D 
##D ## Get information about functionality and filter for functional sequences
##D functionality<-sequences.functionality(data = summarytab$Functionality)
##D ProductiveSequences<-sequences.getProductives(summarytab)
##D 
##D ## Gene usage
##D Vsubgroup.usage<-geneUsage(genes = clones.ind$V_gene, 
##D      functionality = clones.ind$Functionality_all_sequences, level = "subgroup", 
##D      abundance="relative")
##D 
##D Vgenes.comp<-compare.geneUsage(gene.list = list(aaseqtab$V_GENE_and_allele, 
##D      aaseqtab2$V_GENE_and_allele), level = "subgroup", abundance = "relative", 
##D      names = c("IndA", "IndB"), nrCores = 1)
##D plotCompareGeneUsage(comp.tab = Vgenes.comp, color = c("gray97", "darkblue"), 
##D      PDF = "Example")
##D 
##D 
##D ## Gene/gene combinations
##D VDcomb.tab<-sequences.geneComb(family1 = summarytab$V_GENE_and_allele, 
##D      family2 = summarytab$D_GENE_and_allele, level = "subgroup", 
##D      abundance = "relative")
##D plotGeneComb(geneComb.tab=VDcomb.tab, color="red", withNA=FALSE,PDF="test")
##D 
##D 
##D ## Mutation analysis
##D mutation.V<-sequences.mutation(mutationtab = mutationtab, summarytab = summarytab, 
##D      sequence = "V")
##D mutation.CDR1<-sequences.mutation(mutationtab = mutationtab, sequence = "CDR1", 
##D      functionality = TRUE, junctionFr = TRUE)
##D 
##D ## Defining, Filtering and Plotting Clone features
##D clones.tab<-clones(aaseqtab=aaseqtab,summarytab=summarytab, identity=0.85, useJ=TRUE, 
##D      dispCDR3aa=TRUE, dispFunctionality.ratio=TRUE, dispFunctionality.list=TRUE)
##D plotClonesCDR3Length(CDR3Length = clones.ind$CDR3_length_AA, 
##D      functionality = clones.ind$Functionality_all_sequences,  
##D      color="gray",abundance="relative", PDF="test")
##D clones.func<-clones.filterFunctionality(clones.tab = clones.ind, 
##D      filter = "productive")   
##D 
##D ## Find shared clones between individuals
##D sharedclones<-clones.shared(clones.tab = clones.allind, identity = 0.85, useJ = TRUE, 
##D      dispD = TRUE, dispCDR3aa = TRUE)
##D sharedclones.summary<-clones.shared.summary(shared.tab = sharedclones)
##D 
##D ## True diversity
##D trueDiv<-trueDiversity(sequences = aaseqtab$CDR3_IMGT, order = 1)
##D plotTrueDiversity(trueDiversity.tab=trueDiv,color="red",PDF="test")
##D 
##D trueDiv.comp<-compare.trueDversity(sequence.list = list(aaseqtab$CDR3_IMGT, 
##D      aaseqtab2$CDR3_IMGT), names = c("IndA", "IndB"), order = 1, nrCores = 1)
##D plotCompareTrueDiversity(comp.tab = trueDiv.comp, PDF = "Example")
##D 
##D 
##D ## Gini index
##D gini<-gini<-clones.giniIndex(clone.size=clones.ind$total_number_of_sequences)
##D 
##D ## Dissmilarity/distance indices of gene usage and sequence data
##D 
##D distGeneUsage<-geneUsage.distance(geneUsage.tab = Vgenes, method = "bc")
##D distSequence<-sequences.distance(sequences = clones.ind$unique_CDR3_sequences_AA, 
##D      method = "levenshtein", divLength=TRUE)
##D 
##D ## Principal coordinate analysis of distance matrices + visualization
##D distpcoa<-dist.PCoA(dist.tab = distGeneUsage, correction = "none")
##D      # 'groups' data.frame for plot function: in the case, there are no groups:
##D groups.vec<-unlist(apply(data.frame(clones.ind$unique_CDR3_sequences_AA),1,
##D           function(x){strsplit(x,split=", ")[[1]]}))
##D groups.vec<-cbind(groups.vec, 1)
##D plotDistPCoA(pcoa.tab = distpcoa, groups=groups.vec, axes = c(1,2), 
##D      plotCorrection = FALSE, title = NULL, plotLegend=TRUE, PDF = "TEST")    
##D 
## End(Not run)



