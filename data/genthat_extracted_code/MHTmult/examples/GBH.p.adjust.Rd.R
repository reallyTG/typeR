library(MHTmult)


### Name: GBH.p.adjust
### Title: Adjusted P-values for the Group BH Procedure
### Aliases: GBH.p.adjust

### ** Examples

# data is from Example 4.1 in Mehrotra and Adewale (2012)
pval <- list(c(0.031,0.023,0.029,0.005,0.031,0.000,0.874,0.399,0.293,0.077),
             c(0.216,0.843,0.864),
             c(1,0.878,0.766,0.598,0.011,0.864),
             c(0.889,0.557,0.767,0.009,0.644),
             c(1,0.583,0.147,0.789,0.217,1,0.02,0.784,0.579,0.439),
             c(0.898,0.619,0.193,0.806,0.611,0.526,0.702,0.196))
sum(p.adjust(unlist(pval), method = "BH")<=0.1)
DFDR.p.adjust(pval = pval,t=0.1)
DFDR2.p.adjust(pval = pval,t=0.1)
sum(unlist(DFDR.p.adjust(pval = pval,t=0.1))<=0.1)
sum(unlist(DFDR2.p.adjust(pval = pval,t=0.1))<=0.1)

GBH.p.adjust(pval = pval,t=0.1)
sum(unlist(GBH.p.adjust(pval = pval,t=0.1))<=0.1)

t=select.thres(pval,select.method = "BH", comb.method = "minP", alpha = 0.1)
cFDR.cp.adjust(pval, t=t, comb.method="minP")

t1=select.thres(pval, select.method = "bonferroni", comb.method = "minP", alpha = 0.1, k=3)
cFDR.cp.adjust(pval, t=t1, comb.method="minP")

t2=select.thres(pval, select.method = "sidak", comb.method = "minP", alpha = 0.1, k=3)
cFDR.cp.adjust(pval, t=t2, comb.method="minP")



