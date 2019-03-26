# load streambugs library:
# ========================
library(streambugs)

# handler to suppress specific warnings from the streambugs library
.streambugs.suppress.warning.handler <- function(w) {
    if(any(grepl("(no (envcond|parameters) for .*|limitation by (\\w)+( \\w+)? not considered)", w))) {
        invokeRestart("muffleWarning")
    }
}

model <- streambugs.example.model.toy()

# run R implementation:
# =====================

# then in tests run:

# sys.def <- streambugs.get.sys.def(y.names=model$y.names,par=model$par,inp=model$inp)
# streambugs.write.sys.def(sys.def,"sysdef_synthetic_example.dat")

# streambugs.debug=2

# calculate results

withCallingHandlers(
  res.R <- run.streambugs(y.names        = model$y.names,
                          times          = model$times,
                          par            = model$par,
                          inp            = model$inp,
                          C              = FALSE),
  warning = .streambugs.suppress.warning.handler
)


# res.R <- run.streambugs(y.names        = model$y.names,
#                         times          = model$times,
#                         par            = model$par,
#                         inp            = model$inp,
#                         C              = FALSE,
#                         return.res.add = T,
#                         file.def       = "output/streambugs_modelstruct_synth.dat",
#                         file.res       = "output/streambugs_results_synth.dat",
#                         file.add       = "output/streambugs_results_add_synth.dat")

res.R$args = c(model, C = FALSE)

# then in tests run:

# pdf("output/streambugs_results_synth.pdf",width=8,height=6)
# plot.streambugs(res.R$res,res.R$args$par,res.R$args$inp)
# dev.off()


# run C implementation:
# =====================

# re-compile C routines of streambugs
# after having done modifications of C code:

#compile.streambugs()

# initialize global parameter and parameter name vectors for use in C
# and calculate results:

withCallingHandlers(
  res.C <- run.streambugs(y.names  = model$y.names,
                          times    = model$times,
                          par      = model$par,
                          inp      = model$inp,
                          C        = TRUE),
  warning = .streambugs.suppress.warning.handler
)

# res.C <- run.streambugs(y.names  = model$y.names,
#                         times    = model$times,
#                         par      = model$par,
#                         inp      = model$inp,
#                         C        = TRUE,
#                         file.def = "output/streambugs_modelstruct_synth.dat",
#                         file.res = "output/streambugs_results_synth_C.dat")

res.C$args = c(model, C = TRUE)

# then in tests run:

# pdf("streambugs_results_synth_C.pdf",width=8,height=6)
# plot.streambugs(res.C$res,res.C$args$par,res.C$args$inp)
# dev.off()


########

# res.add <- res.R$res.add
#
# source("libraries/construct_matrix_res_add_t.r")
# source("libraries/get_res_add_t.r")
#
# res.add.t <- construct.matrix.res.add.t(res.add,t=model$times[length(model$times)],y.names,
#                                         file=paste("output/res_add_tend_synth",".dat",sep=""))
#
# factors.all.inverts <- get.res.add.t.invertebrates(res.add.t,
#                                                    model$y.names.invertebrates=
#                                                      model$y.names$y.names[which(model$y.names$y.groups=="Invertebrates")])
# factors.all.inverts
