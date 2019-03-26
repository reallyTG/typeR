library(BaTFLED3D)


### Name: get_model_params
### Title: Get parameters to build a BaTFLED model
### Aliases: get_model_params

### ** Examples

args <- c('decomp=Tucker', 'row.share=F',
          'A1.intercept=T', 'A2.intercept=T', 'A3.intercept=F',
          'H1.intercept=T', 'H2.intercept=T', 'H3.intercept=T',
          'plot=T', 'verbose=F','R1=4', 'R2=4', 'R3=2',
          'm1.alpha=1e-10', 'm2.alpha=1e-10', 'm3.alpha=1',
          'm1.beta=1e10', 'm2.beta=1e10', 'm3.beta=1',
          'core.3D.alpha=1e-10', 'core.3D.beta=1e10',
          'parallel=T', 'cores=5', 'lower.bnd=T',
          'update.order=c(3,2,1)', 'show.mode=c(1,2,3)',
          'wrong=1')
model.params <- get_model_params(args)



