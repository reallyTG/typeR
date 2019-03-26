library(cghRA)


### Name: model.apply
### Title: Computes copy number for a set of CGH segments
### Aliases: model.apply

### ** Examples

  # Generating random segmentation results
  ## with 30% normal cells contamination
  ## with +10% for normal DNA labelling
  segLogRatios <- c(
    rnorm(
      sample(5:20, 1),
      mean = log((1*0.7 + 2*0.3)/(2*1.1), 2),   # One deletion
      sd = 0.08
    ),
    rnorm(
      sample(80:120, 1),
      mean = log(2/(2*1.1), 2),                 # No alteration
      sd = 0.08
    ),
    rnorm(
      sample(40:60, 1),
      mean = log((3*0.7 + 2*0.3)/(2*1.1), 2),   # One more copy
      sd = 0.08
    )
  )
  segLogRatios <- sample(segLogRatios)
  segLengths <- as.integer(3 + round(rchisq(length(segLogRatios), 1)*100))
  segEnds <- cumsum(segLengths)
  segStarts <- c(1L, head(segEnds, -1))
  segChroms <- rep("chr1", length(segEnds))
  
  # Generated genome
  genome <- data.frame(
    segChroms,
    segStarts,
    segEnds,
    segLogRatios,
    segLengths
  )
  print(genome)
  
  # Automatic modelization
  model <- model.auto(
    segLogRatios = segLogRatios,
    segChroms = segChroms,
    segLengths = segLengths
  )
  
  # Profile simplification
  segments <- model.apply(
    segStarts,
    segEnds,
    segChroms,
    segLogRatios,
    segLengths,
    model = model,
    exact = FALSE,
    merge = TRUE
  )
  layout(matrix(1:2, ncol=1))
  plot(x=segStarts, y=segLogRatios, type="s", xlab="Position", ylab="Log Ratios")
  plot(x=segments$segStarts, y=segments$segCopies, type="s", xlab="Position", ylab="Copies")
  print(segments)
  
  layout(1)



