library(MAGNAMWAR)


### Name: AnalyzeOrthoMCL
### Title: Main OrthoMCL Analysis
### Aliases: AnalyzeOrthoMCL

### ** Examples

#Linear Model

## Not run: 
##D mcl_mtrx <- AnalyzeOrthoMCL(after_ortho_format, pheno_data, 'lm',
##D  'Treatment', resp='RespVar')
## End(Not run)

# the rest of the examples are not run for time's sake
#Linear Mixed Effect with one random effect
## Not run: 
##D mcl_mtrx <- AnalyzeOrthoMCL(after_ortho_format, pheno_data, 'lmeR1',
##D 'Treatment', resp='RespVar', rndm1='Experiment')
## End(Not run)


#Linear Mixed Effect with two independent random effects
## Not run: 
##D mcl_mtrx <- AnalyzeOrthoMCL(after_ortho_format, pheno_data, 'lmeR2ind',
##D  'Treatment', resp='RespVar', rndm1='Experiment', rndm2='Vial')
## End(Not run)


#Linear Mixed Effect with rndm2 nested in rndm1
## Not run: 
##D mcl_mtrx <- AnalyzeOrthoMCL(after_ortho_format, pheno_data, 'lmeR2nest',
##D  'Treatment',  resp='RespVar', rndm1='Experiment', rndm2='Vial')
## End(Not run) 


#Linear Mixed Effect with two independent random effects and one additional fixed effect
## Not run: 
##D mcl_mtrx3 <- AnalyzeOrthoMCL(after_ortho_format, pheno_data, 'lmeF2',
##D  'Treatment', resp='RespVar', fix2='Treatment', rndm1='Experiment', rndm2='Vial', princ_coord = 4)
## End(Not run)


#Wilcoxon Test
## Not run: 
##D mcl_mtrx <- AnalyzeOrthoMCL(after_ortho_format, pheno_data, 'wx',
##D  'Treatment', resp='RespVar')
## End(Not run)

# ~ 5 minutes
#Survival with two independent random effects, run on multiple cores
## Not run: 
##D mcl_mtrx <- AnalyzeOrthoMCL(after_ortho_format, starv_pheno_data, 'TRT', model='survmulti',
##D  time='t2', event='event', rndm1='EXP', rndm2='VIAL', multi=1)
## End(Not run)

# ~ 5 minutes
#Survival with two independent random effects and one additional fixed effect,
#including drops on multi cores
## Not run: 
##D mcl_mtrx <- AnalyzeOrthoMCL(after_ortho_format, starv_pheno_data, 'TRT', model='survmulticensor',
##D  time='t1', time2='t2', event='event', rndm1='EXP', rndm2='VIAL', fix2='BACLO', multi=1)
##D  
## End(Not run)
#to be appended with SurvAppendMatrix



