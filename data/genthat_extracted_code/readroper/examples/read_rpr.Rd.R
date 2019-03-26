library(readroper)


### Name: read_rpr
### Title: Reads Roper Center datasets
### Aliases: read_rpr

### ** Examples

fwf_sample <- readroper_example('testMultiCard.txt')
cat(readr::read_lines(fwf_sample))
fwf_sample2 <- readroper_example('testSingleCard.txt')
cat(readr::read_lines(fwf_sample2))
# 1. Fixed width file, first card, multi-card
read_rpr(col_positions=c(1,2,4), widths=c(1,2,1),
col_names=c('V1','V2','V3'), filepath=fwf_sample, card_read=1, cards=2)
# 2 .Fixed width file, first card, single card
read_rpr(col_positions=c(1,2,4), widths=c(1,2,1),
col_names=c('V1','V2','V3'), filepath=fwf_sample2)
 # 3. Fixed width file, second card, multi-card
read_rpr(col_positions=c(1,2,4), widths=c(1,2,1),
col_names=c('V1','V2','V3'), filepath=fwf_sample, card_read=2, cards=2)




