library(VertexSort)


### Name: dpr, sdpr, dnpr, idpr, odpr
### Title: Functions for Network Randomization using different algorithms
### Aliases: dpr sdpr dnpr idpr odpr
### Keywords: Graphs Optimization

### ** Examples

  ## generate a random graph of the kinase-phosphatase network by using
  ## each of the five algorithms

  ## load the VertexSort library
  library(VertexSort)

  ## load interactions of the kinase-phosphatase network (kp-net)
  data("interactions")
  vs_kp_net <- vertex.sort(interactions)
  kp_net    <- vs_kp_net$graph

  ## dpr function: randomize a network with preserving its node degrees
  ## notice the difference in execution time when using and
  ## not using the parallel programning mode
  ptm <- proc.time()
  rand_g <- dpr(kp_net, 4)            # without parallel mode
  proc.time() - ptm

  ptm <- proc.time()
  rand_g <- dpr(kp_net, 4, TRUE, 4)   # with parallel mode
  proc.time() - ptm

  ## verify that rand_g have the same in- and out-degrees as those
  ## of kp_net should obtain TRUE in both commands.
  all(degree(kp_net, V(kp_net), "in")==degree(rand_g[[1]], V(rand_g[[1]]), "in"))
  all(degree(kp_net, V(kp_net), "out")==degree(rand_g[[1]], V(rand_g[[1]]), "out"))

  ## sdpr function: randomize a network with preserving similar node degrees
  rand_g <- sdpr(kp_net, 1)
  ## verify that rand_g have similar in- and out-degrees to those of
  ## kp_net. Should be -1, 0 or 1
  sort(unique(degree(kp_net, V(kp_net), "in")-degree(rand_g[[1]], V(rand_g[[1]]), "in")))
  sort(unique(degree(kp_net, V(kp_net), "out")-degree(rand_g[[1]], V(rand_g[[1]]), "out")))

  ## dnpr function: randomize a network without preserving its node degrees
  rand_g <- dnpr(kp_net, 1)
  ## verify that rand_g have different in- and out-degrees of those of
  ## kp_net. Should get FALSE in both commands
  all(degree(kp_net, V(kp_net), "in")==degree(rand_g[[1]], V(rand_g[[1]]), "in"))
  all(degree(kp_net, V(kp_net), "out")==degree(rand_g[[1]], V(rand_g[[1]]), "out"))

  ## idpr function: randomize a network with preserving its node in-degrees
  rand_g <- idpr(kp_net, 1)
  ## verify that rand_g have same in-degrees and different out-degrees as
  ## those of kp_net. Should get TRUE and FALSE respectively.
  all(degree(kp_net, V(kp_net), "in")==degree(rand_g[[1]], V(rand_g[[1]]), "in"))
  all(degree(kp_net, V(kp_net), "out")==degree(rand_g[[1]], V(rand_g[[1]]), "out"))

  ## odpr function: randomize a network with preserving its node out-degrees
  rand_g <- odpr(kp_net, 1)
  ## verify that rand_g have same out-degrees and different in-degrees as
  ## those of kp_net. Should get FALSE and TRUE respectively.
  all(degree(kp_net, V(kp_net), "in")==degree(rand_g[[1]], V(rand_g[[1]]), "in"))
  all(degree(kp_net, V(kp_net), "out")==degree(rand_g[[1]], V(rand_g[[1]]), "out"))



