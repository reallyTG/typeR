library(replyr)


### Name: gapply
### Title: grouped ordered apply
### Aliases: gapply

### ** Examples


d <- data.frame(
  group = c(1, 1, 2, 2, 2),
  order = c(.1, .2, .3, .4, .5),
  values = c(10, 20, 2, 4, 8)
)

# User supplied window functions.  They depend on known column names and
# the data back-end matching function names (as cumsum).
cumulative_sum <- function(d) {
  dplyr::mutate(d, cv = cumsum(values))
}
rank_in_group <- function(d) {
  d %.>%
    dplyr::mutate(., constcol = 1) %.>%
    dplyr::mutate(., rank = cumsum(constcol)) %.>%
    dplyr::select(., -constcol)
}

for (partitionMethod in c('group_by', 'split', 'extract')) {
  print(partitionMethod)
  print('cumulative sum example')
  print(
    gapply(
      d,
      'group',
      cumulative_sum,
      ocolumn = 'order',
      partitionMethod = partitionMethod
    )
  )
  print('ranking example')
  print(
    gapply(
      d,
      'group',
      rank_in_group,
      ocolumn = 'order',
      partitionMethod = partitionMethod
    )
  )
  print('ranking example (decreasing)')
  print(
    gapply(
      d,
      'group',
      rank_in_group,
      ocolumn = 'order',
      decreasing = TRUE,
      partitionMethod = partitionMethod
    )
  )
}




