library(SoilHyP)


### Name: fitSHP
### Title: Fit soil hydraulic properties
### Aliases: fitSHP

### ** Examples

## Not run: 
##D data('dataSHP')
##D # -------------------------------------------------------------------
##D # fit Soil Hydraulic Properties (SHP)
##D # -------------------------------------------------------------------
##D ans <- fitSHP(obs         = list(th = dataSHP$th, K = dataSHP$Ku),
##D              suc          = list(th = dataSHP$suc, K = dataSHP$suc),
##D              FUN.shp      = 'vg',
##D              modality     = 'uni',
##D              par.shp      =  NULL,
##D              fit          = 'both',
##D              weighting    = 'var',
##D              log          = c('alfa', 'n', 'ks'),
##D              control      = list(ncomplex = 15, reltol = 1e-07,tolsteps = 7),
##D              suc.negativ  = TRUE,
##D              integral     = FALSE,
##D              L            = 0,
##D              print.info   = TRUE
##D )
##D ans$par
##D plot(ans)
##D # --------------------------------------------------------------------
##D # bimodal van Genuchten-Mualem
##D ans <- fitSHP(obs         = list(th = dataSHP$th, K = dataSHP$Ku),
##D              suc          = list(th = dataSHP$suc, K = dataSHP$suc),
##D              FUN.shp      = 'vg',
##D              modality     = 'bi',
##D              par.shp      =  c(),
##D              fit          = 'both',
##D              weighting    = 'var',
##D              log          = c('alfa', 'n', 'ks', 'alfa2', 'n2'),
##D              suc.negativ  = TRUE,
##D              integral     = FALSE,
##D              L            = 0,
##D              print.info   = TRUE,
##D              control      = list(ncomplex = 15, reltol = 1e-07,tolsteps = 7)
##D )
##D ans$par
##D plot(ans)
## End(Not run)



