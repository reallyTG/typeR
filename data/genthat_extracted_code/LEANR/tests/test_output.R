context("Conformity of LEAN result object with expectations")

# set up test case
data(g_red)
data(pvals_red)
test.scores<-pvals_red
sif_out<-'./test.sif'
res1<-run.lean(ranking=test.scores,network=g_red,n_reps=10^2,ncores=2)
sig_genes<-rownames(res1$restab[res1$restab[,'pstar']<0.1,])
sig_genes_rand<-rownames(res1$randtab[res1$randtab[,'pstar']<0.1,])
sample_gene<-sample(sig_genes,1)

test_that('True results differ from randomized results', {
  # restab and randtab have same number of rows and columns
  expect_identical(dim(res1$restab),dim(res1$randtab))
  # the most "significant" genes of the random and real results are not identical
  expect_gt(length(setdiff(sig_genes,sig_genes_rand)),0)
  expect_gt(length(setdiff(sig_genes_rand,sig_genes)),0)
})

test_that('Internal result objects consistent with each other', {
  # The local subnetworks only contain genes for which a pval is measured
  expect_equal(length(setdiff(unlist(res1$nhs),names(test.scores))),0)
  expect_equal(length(setdiff(names(test.scores),unlist(res1$nhs))),0)
  # The local subnetworks only contain genes present in the graph
  expect_equal(length(setdiff(unlist(res1$nhs),V(g_red)$name)),0)
  expect_equal(length(setdiff(V(g_red)$name,unlist(res1$nhs))),0)
})

write.ls.to.sif(sample_gene,res1,sif_out)
ls.info<-get.ls.info(sample_gene,res1)
test_that('Subnetwork extraction functions work', {
  # get.ls.info returns a valid data.frame
  expect_gte( nrow(ls.info),1)
  # write.ls.to.sif creates the proper result file
  expect_true(file.exists(sif_out))
  # result file readable and is a valid sif file
  if (nrow(ls.info)>1){
    expect_equal(ncol(read.table(sif_out,sep='\t',quote='',comment='',header=F)),3)
  }
})

file.remove(sif_out)