## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----echo=T--------------------------------------------------------------
sample_n = 100
gene_n = 100

## ----echo=T--------------------------------------------------------------
set.seed(101)
gene_mean_diff = rnorm(gene_n, 0, 5)

## ----echo=T--------------------------------------------------------------
grand_mean = 100
sample_sd = 1
simulate_pop = 
  do.call(cbind
          , lapply(1:gene_n, function(k){
            out = data.frame(gene=c(rnorm(sample_n, 0, sample_sd)+grand_mean
                                  ,rnorm(sample_n, gene_mean_diff[k], sample_sd)+grand_mean)
            )
            colnames(out) = paste0('gene_', k)
            return(out)
          }))
dta = cbind(pop=rep(c('trt', 'contr'), each=sample_n), samples=rep(c(1:sample_n), 2), simulate_pop)
dta[c(1:5, 101:105), 1:7]
summary(dta[, c(paste0('gene_',1:4))])

## ----echo=T--------------------------------------------------------------
if(!'reshape2'%in%rownames(installed.packages())){install.packages('reshape2')}
plot.dta = reshape2::melt(dta[, c('pop', 'gene_1', 'gene_2', 'gene_3', 'gene_4')], id.vars='pop')
colnames(plot.dta) = c('pop', 'gene', 'expressionValue')
if(!'ggplot2'%in%rownames(installed.packages())){install.packages('ggplot2')}
library(ggplot2)
ggplot(plot.dta, aes(expressionValue, color=pop, fill=pop))+
  geom_density(alpha=0.1)+
  facet_wrap(~gene, nrow=1)+
  theme_bw()+
  theme(panel.grid=element_blank())

## ----echo=T--------------------------------------------------------------
brt_cut = 5
library(brt)
print(gene_mean_diff)
brt.result = 
  do.call(rbind
          , lapply(1:gene_n, function(i){
            dta.tmp = dta[, c(1, i+2)]
            pop1 = subset(dta.tmp, pop=='trt')[, 2, drop=T]
            pop2 = subset(dta.tmp, pop=='contr')[, 2, drop=T]
            brt.tmp = brt.test(x=pop1, y=pop2, hi=brt_cut, var.equal=T)
            t.tmp = t.test(x=pop1, y=pop2, var.equal=T)
            out = data.frame(gene=colnames(dta.tmp)[2]
                             , true_diff=gene_mean_diff[i]
                             , est_diff=brt.tmp$mu_y-brt.tmp$mu_x
                             , brt.test=brt.tmp$brt.pvalue
                             , t.test=t.tmp$p.value)
          }))
head(brt.result)

## ----echo=T--------------------------------------------------------------
plot.pvalue = reshape2::melt(brt.result[, c('brt.test', 't.test')])
ggplot(plot.pvalue, aes(value, color=variable, fill=variable))+
  geom_histogram(alpha=0.5)+
  facet_wrap(~variable, nrow=1, scales='free_y')+
  theme_bw()+
  theme(panel.grid=element_blank())

## ----echo=T--------------------------------------------------------------
plot.diff.value = reshape2::melt(
                        with(brt.result
                             , data.frame(est_diff=est_diff, log_brt=-log(brt.test), log_t=-log(t.test))
                        )
                  , id.vars='est_diff')
ggplot(plot.diff.value, aes(x=est_diff, y=value, color=variable))+
  geom_point()+
  geom_hline(yintercept=-log(0.05), color='red')+
  facet_wrap(~variable)+
  theme_bw()+
  theme(panel.grid=element_blank())



## ----echo=T--------------------------------------------------------------
brt.result$fdr.brt.pvalue = p.adjust(brt.result$brt.test, method='BH')
brt.result$fdr.t.test.pvalue = p.adjust(brt.result$t.test, method='BH')
head(brt.result)

## ----echo=T--------------------------------------------------------------
confusion.dta = with(brt.result
                     , data.frame(gene=brt.result$gene
                                  , truly_diff=factor(true_diff>=brt_cut, levels=c('TRUE', 'FALSE'))
                                  , brt_diff=factor(fdr.brt.pvalue<=0.05, levels=c('TRUE', 'FALSE'))
                                  , t_diff=factor(fdr.t.test.pvalue<=0.05, levels=c('TRUE', 'FALSE')))
                    )
### confusion matrix based on BRT
with(confusion.dta, table(brt_diff, truly_diff))

### confusion matrix based on t.test
with(confusion.dta, table(t_diff, truly_diff))

## ----echo=T--------------------------------------------------------------
if(!'pasilla'%in%rownames(installed.packages())){source("https://bioconductor.org/biocLite.R"); biocLite("pasilla")}
library(pasilla)
CountDataFile = system.file('extdata', 'pasilla_gene_counts.tsv', package='pasilla', mustWork=T)
MetaDataFile = system.file('extdata', 'pasilla_sample_annotation.csv', package='pasilla', mustWork=T)
countData = read.csv(CountDataFile, sep='\t')
colnames(countData)[-1]=paste0(colnames(countData)[-1], 'fb')
metaData = read.csv(MetaDataFile)
head(countData)
head(metaData)

## ----echo=T--------------------------------------------------------------
if(!'DESeq2'%in%rownames(installed.packages())){source("https://bioconductor.org/biocLite.R"); biocLite("DESeq2")}
### construct the DESeq object
library(DESeq2)

countRawDeseq2 = DESeqDataSetFromMatrix(countData=as.matrix(countData[,-1])
                                        , colData=metaData[, c('file', 'condition')]
                                        , design=~condition)
### apply vst transformation
vstData = vst(countRawDeseq2)

## ----echo=T--------------------------------------------------------------
### explore the mean-variance stablization after vst
if(!'vsn'%in%rownames(installed.packages())){source("https://bioconductor.org/biocLite.R"); biocLite("vsn")}
vsn::meanSdPlot(assay(vstData))

## ----echo=T--------------------------------------------------------------
### extract the transformed data
dta_vst = data.frame(gene_id=countData[,1], assay(vstData))
### apply brt to compare the treatment effect
countResult = do.call(rbind
                      , lapply(1:nrow(dta_vst), function(i){
                        tmp1 = brt.test(x=dta_vst[i,c(2:5)], y=dta_vst[i,c(6:8)], hi=0.2)
                        out = data.frame(gene=dta_vst[i,1]
                             , est_diff=tmp1$mu_y-tmp1$mu_x
                             , brt.test=tmp1$brt.pvalue
                             )
                      }))

## ----echo=T--------------------------------------------------------------
hist(countResult$brt.test)

