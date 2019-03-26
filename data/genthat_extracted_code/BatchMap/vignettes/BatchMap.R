## ----load_cache,echo=FALSE-----------------------------------------------
# To speed up vignette building, we load some cached results here
load(system.file("example/cached.results.RData",package = "BatchMap"))

## ----reading_data, eval=TRUE---------------------------------------------
suppressPackageStartupMessages(library(BatchMap))

input_file <- system.file("example/sim7.5k.txt.gz",package = "BatchMap")
outcross <- read.outcross2(input_file)
outcross

## ----resolve_bins, eval=TRUE---------------------------------------------
bins <- find.bins(outcross, exact = FALSE)
outcross_clean <- create.data.bins(outcross, bins)
outcross_clean

## ----twopoints, eval=TRUE------------------------------------------------
twopt_table <- rf.2pts(outcross_clean)
# Check the size
format(object.size(twopt_table),units = "Mb")

## ----group, eval=TRUE----------------------------------------------------
linkage_groups <- group(make.seq(input.obj = twopt_table, "all"),
                        LOD = 12)

## ----split, eval=TRUE----------------------------------------------------
testcrosses <- pseudo.testcross.split(linkage_groups)
testcrosses$LG1.d2.15

## ----record, eval=FALSE--------------------------------------------------
#  # The result of this function is cached
#  ordered_sequences <- lapply(testcrosses, record.parallel, times = 10, cores = 1)

## ----pick_bs, eval=TRUE--------------------------------------------------
LG1_d1.10 <- ordered_sequences$LG1.d1.10
LG1_d2.15 <- ordered_sequences$LG1.d2.15
batch_size_LG1_d1.10 <- pick.batch.sizes(LG1_d1.10, 
                                         size = 50, 
                                         overlap = 30, 
                                         around = 10)
batch_size_LG1_d2.15 <- pick.batch.sizes(LG1_d2.15, 
                                         size = 50, 
                                         overlap = 30, 
                                         around = 10)
c(batch_size_LG1_d1.10, batch_size_LG1_d2.15)

## ----map_batches, eval=FALSE---------------------------------------------
#  # The result of this function is cached
#  map_LG1_d1.10 <- map.overlapping.batches(input.seq = LG1_d1.10,
#                                           size = batch_size_LG1_d1.10,
#                                           phase.cores = 4,
#                                           overlap = 30)

## ---- print_maps, eval=TRUE----------------------------------------------
map_LG1_d1.10$Map

## ----ripple,eval=FALSE---------------------------------------------------
#  # The result of this function is cached
#  rip_LG1_d1.10 <- map.overlapping.batches(input.seq = LG1_d1.10,
#                                           size = batch_size_LG1_d1.10,
#                                           phase.cores = 4,
#                                           overlap = 30,
#                                           fun.order = ripple.ord,
#                                           ripple.cores = 10,
#                                           method = "one",
#                                           min.tries = 1,
#                                           ws = 4)

## ---- mistakes, eval=TRUE------------------------------------------------
err_rate <- function(seq)
{
  # Get the marker position
  s_num <- seq$seq.num
  # If the sequence is reverse, turn it around
  if(cor(s_num, 1:length(s_num)) < 0)
    s_num <- rev(s_num)
  # Get the number of misorders and divide by the total length
  sum(order(s_num) - 1:length(s_num) != 0) / length(s_num)
}

c("BatchMap" = err_rate(map_LG1_d1.10$Map),
  "RippleBatchMap" = err_rate(rip_LG1_d1.10$Map))

