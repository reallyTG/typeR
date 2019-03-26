library(MSPRT)


### Name: ovr.repl.t
### Title: A particular replication step in 'overshoot.t()'
### Aliases: ovr.repl.t

### ** Examples


N.max = 30
ovr.repl.t( side = "right", error.type= "type1", batch.seq= 2:N.max, type1 = 0.005,
            null= 0, gen.par= 0, up= 160, low= 0.2, N= N.max, seed= 1)

ovr.repl.t( side = "right", error.type= "type2", batch.seq= 2:N.max, type1 = 0.005,
            null= 0, gen.par= 1.5, up= 160, low= 0.2, N= N.max, seed= 1)




