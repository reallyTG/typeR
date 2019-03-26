library(MSPRT)


### Name: ovr.repl.ber
### Title: A particular replication step in 'overshoot.ber()'
### Aliases: ovr.repl.ber

### ** Examples


N.max = 30
ovr.repl.ber( error.type= "type1", batch.seq= 1:N.max, null= 0.5, gen.par= 0.5,
              alt.LR= c(0.5,0.55), alt.psi= 0.4, up= 160, low= 0.2, N= N.max, seed= 1)
               
ovr.repl.ber( error.type= "type2", batch.seq= 1:N.max, null= 0.5, gen.par= 0.7,
              alt.LR= c(0.5,0.55), alt.psi= 0.4, up= 160, low= 0.2, N= N.max, seed= 1)




