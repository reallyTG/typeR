library(MSPRT)


### Name: ovr.repl.norm
### Title: A particular replication step in 'overshoot.norm()'
### Aliases: ovr.repl.norm

### ** Examples


N.max = 30
ovr.repl.norm( error.type= "type1", batch.seq= 1:N.max, null= 0,
               gen.par= c(0,1), alt.LR= 1, up= 160, low= 0.2, N= N.max, seed= 1)

ovr.repl.norm( error.type= "type2", batch.seq= 1:N.max, null= 0,
               gen.par= c(1.5,1), alt.LR= 1, up= 160, low= 0.2, N= N.max, seed= 1)




