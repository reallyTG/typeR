library(SPINA)


### Name: SPINA.sGD
### Title: Calculated Sum Activity of Step-Up Deiodinases (SPINA-GD) in
###   standardised form
### Aliases: SPINA.sGD
### Keywords: SPINA

### ** Examples

TSH <- c(1, 3.24, 0.7);
FT4 <- c(16.5, 7.7, 9);
FT3 <- c(4.5, 28, 6.2);
print(paste("GT^:", SPINA.GT(TSH, FT4)));
print(paste("GD^:", SPINA.GD(FT4, FT3)));
print(paste("sGD^:", SPINA.sGD(FT4, FT3)));



