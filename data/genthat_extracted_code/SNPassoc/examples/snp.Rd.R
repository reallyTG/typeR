library(SNPassoc)


### Name: snp
### Title: SNP object
### Aliases: snp is.snp as.snp reorder.snp summary.snp plot.snp
###   dominant.snp codominant.snp recessive.snp additive.snp print.snp
###   [.snp print.summary.snp
### Keywords: utilities

### ** Examples

# some examples of snp data in different formats

dat1  <- c("21", "21", "11", "22", "21",
                    "22", "22", "11", "11", NA)
ans1  <- snp(dat1,sep="")
ans1

dat2 <- c("A/A","A/G","G/G","A/G","G/G",
                    "A/A","A/A","G/G",NA)
ans2  <- snp(dat2,sep="/")
ans2

dat3 <- c("C-C","C-T","C-C","T-T","C-C",
                    "C-C","C-C","C-C","T-T",NA)
ans3 <- snp(dat3,sep="-")
ans3


dat4 <- c("het","het","het","hom1","hom2",
                    "het","het","hom1","hom1",NA)
ans4 <- snp(dat4,name.genotypes=c("hom1","het","hom2"))
ans4


# summary 
summary(ans3)

# plots

plot(ans3)
plot(ans3,type=pie)
plot(ans3,type=pie,label="SNP 10045")




