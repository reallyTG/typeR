library(stream)


### Name: evaluate
### Title: Evaluate Clusterings
### Aliases: evaluate evaluate_cluster print.stream_eval

### ** Examples

stream <- DSD_Gaussians(k=3, d=2)

dstream <- DSC_DStream(gridsize=0.05, Cm=1.5)
update(dstream, stream, 500)
plot(dstream, stream)
# Evaluate micro-clusters
# Note: we use here only n=500 points for evaluation to speed up execution
evaluate(dstream, stream, measure=c("numMicro","numMacro","purity","crand", "SSQ"),
  n=100)

# DStream also provides macro clusters. Evaluate macro clusters with type="macro"
plot(dstream, stream, type="macro")
evaluate(dstream, stream, type ="macro",
  measure=c("numMicro","numMacro","purity","crand", "SSQ"), n=100)

# Points are by default assigned to the closest micro clusters for evalution.
# However, points can also be assigned to the closest macro-cluster using
# assign="macro".
evaluate(dstream, stream, type ="macro", assign="macro",
  measure=c("numMicro","numMacro","purity","crand", "SSQ"), n=100)

# Evaluate an evolving data stream
stream <- DSD_Benchmark(1)
dstream <- DSC_DStream(gridsize=0.05, lambda=0.1)
evaluate_cluster(dstream, stream, type="macro", assign="micro",
  measure=c("numMicro","numMacro","purity","crand"),
  n=600, horizon=100)

## Not run: 
##D # animate the clustering process
##D reset_stream(stream)
##D dstream <- DSC_DStream(gridsize=0.05, lambda=0.1)
##D animate_cluster(dstream, stream, horizon=100, n=5000,
##D   measure=c("crand"), type="macro", assign="micro",
##D   plot.args = list(type="both", xlim=c(0,1), ylim=c(0,1)))
## End(Not run)



