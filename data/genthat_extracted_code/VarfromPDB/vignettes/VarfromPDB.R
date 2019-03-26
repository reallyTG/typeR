## ----eval=FALSE----------------------------------------------------------
#  library(VarfromPDB)
#  library(RISmed)
#  library(stringi)

## ----eval=FALSE----------------------------------------------------------
#  keywords = "Joubert syndrome"
#  work.path = getwd()
#  setwd(work.path)
#  prefix = ifelse(length(grep("\\|",keywords)) >0,str_trim(unlist(strsplit(keywords,"\\|")))[1],keywords)
#  prefix = ifelse(length(grep(" ",prefix)) >0,paste(unlist(strsplit(prefix," ")),collapse="."),prefix)
#  out.path = paste(work.path,prefix,sep="/")
#  dir.create(out.path)

## ----eval=FALSE----------------------------------------------------------
#  localPDB()

## ----eval=FALSE----------------------------------------------------------
#  HPO.phenotype = pheno_extract_HPO(keywords)
#  phenoID.hpo.omim = as.character(unique(HPO.phenotype[grep("OMIM",HPO.phenotype[,1]),1]))
#  phenoID.hpo.orphanet = as.character(unique(HPO.phenotype[grep("ORPHA",HPO.phenotype[,1]),1]))
#  genes.hpo = as.character(unique(HPO.phenotype[,3]))
#  genes.hpo = genes.hpo[genes.hpo!=""]
#  write.table(HPO.phenotype,paste(out.path,"/","HPO_",prefix,".txt",sep=""),sep="\t",row.names=F,quote=F)

## ----eval=FALSE----------------------------------------------------------
#  orphanet.phenotype = extract_genes_orphanet(keyword = keywords, HPO.disease = phenoID.hpo.orphanet)
#  genes.orphanet = orphanet.phenotype[,"GeneSymbol"]
#  genes.merge = union(genes.orphanet, genes.hpo)
#  write.table(orphanet.phenotype,paste(out.path,"/","Orphanet_",prefix,".txt",sep=""),sep="\t",row.names=F,quote=F)

## ----eval=FALSE----------------------------------------------------------
#  clinvar.phenotype = extract_clinvar(keyword= keywords, HPO.disease = phenoID.hpo.omim, genelist = genes.merge)
#  genes.clinvar = clinvar.phenotype [[1]]
#  variants.clinvar = clinvar.phenotype [[2]]
#  write.table(genes.clinvar,paste(out.path,"/","Clinvar_genes_",prefix,".txt",sep=""),sep="\t",row.names=F,quote=F)
#  write.table(variants.clinvar,paste(out.path,"/","Clinvar_variants_",prefix,".txt",sep=""),sep="\t",row.names=F,quote=F)

## ----eval=FALSE----------------------------------------------------------
#  UniProt.phenotype = extract_uniprot(keyword= keywords,HPO.disease = phenoID.hpo.omim, genelist = genes.merge)
#  genes.UniProt = UniProt.phenotype [[1]]
#  variants.UniProt = UniProt.phenotype [[2]]
#  write.table(genes.UniProt,paste(out.path,"/","Uniprot_genes_",prefix,".txt",sep=""),sep="\t",row.names=F,quote=F)
#  write.table(variants.UniProt,paste(out.path,"/","Uniprot_variants_",prefix,".txt",sep=""),sep="\t",row.names=F,quote=F)

## ----eval=FALSE----------------------------------------------------------
#  genesPDB = genes_compile(HPO = HPO.phenotype, orphanet = orphanet.phenotype, clinvar = genes.clinvar, uniprot = genes.UniProt)
#  write.table(genesPDB,paste(out.path,"/","PublicDB_genes_",prefix,".txt",sep=""),sep="\t",row.names=F,quote=F)
#  variantsPDB <- variants_compile(clinvar = variants.clinvar, uniprot = variants.UniProt)
#  write.table(variantsPDB,paste(out.path,"/","PublicDB_variants_",prefix,".txt",sep=""),sep="\t",row.names=F,quote=F)

## ----eval=FALSE----------------------------------------------------------
#  pubmed.phenotype <- extract_pubmed(query = "(Joubert syndrome[Title\\/Abstract]) AND (gene[Title\\/Abstract] OR genes[Title\\/Abstract] OR mutation[Title\\/Abstract] OR mutations[Title\\/Abstract] OR polymorphisms[Title\\/Abstract] OR genotype[Title\\/Abstract] OR SNP[Title\\/Abstract] OR SNPs[Title\\/Abstract] OR associated[Title\\/Abstract] OR translocation[Title\\/Abstract])", keyword=keywords);
#  genes.pubmed <- pubmed.phenotype[[1]]
#  write.table(genes.pubmed,paste(out.path,"/","PubMed_",prefix,".txt",sep=""),sep="\t",row.names=F,quote=F)
#  write.table(pubmed.phenotype[[2]],paste(out.path,"/","PubMed_abstract_",prefix,".txt",sep=""),sep="\t",row.names=F,quote=F,col.names=F)

## ----eval=FALSE----------------------------------------------------------
#  genes.pubmed.sel <- genes.pubmed[genes.pubmed[,"cdna.change.HGVS"] != ""|genes.pubmed[,"p.change.HGVS"] != "",]
#  geneAll <- genes_add_pubmed(keyword = keywords, genepdb = genesPDB, pubmed = genes.pubmed.sel)
#  write.table(geneAll,paste(out.path,"/","Genes_all_",prefix,".txt",sep=""),sep="\t",row.names=F,quote=F)

