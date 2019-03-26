library(TropFishR)


### Name: lfqModify
### Title: Modify lfq data for further analysis
### Aliases: lfqModify
### Keywords: function length-frequency lfq

### ** Examples

data(synLFQ4)

## summarise catch matrix per year
lfq_sum <- lfqModify(synLFQ4, vectorise_catch = TRUE)

## change bin size
lfq_bin <- lfqModify(synLFQ4, bin_size = 4)

## add plus_group
lfq_plus <- lfqModify(synLFQ4, plus_group = 85.5)




