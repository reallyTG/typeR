library(CopulaDTA)


### Name: traceplot.cdtafit
### Title: Trace plot using ggplot2.
### Aliases: traceplot.cdtafit

### ** Examples

data(telomerase)
model1 <-  cdtamodel(copula = 'fgm')

model2 <- cdtamodel(copula = 'fgm',
               modelargs=list(param=2,
                              prior.lse='normal',
                              par.lse1=0,
                              par.lse2=5,
                              prior.lsp='normal',
                              par.lsp1=0,
                              par.lsp2=5))

model3 <-  cdtamodel(copula = 'fgm',
               modelargs = list(formula.se = StudyID ~ Test - 1))
## Not run: 
##D fit1 <- fit(model1,
##D                 SID='ID',
##D                 data=telomerase,
##D                 iter=2000,
##D                 warmup=1000,
##D                 thin=1,
##D                 seed=3)
##D 
##D traceplot(fit1)
##D 
##D traceplot(fit1) +
##D theme(axis.text.x = element_text(size=10, colour='black'),
##D       axis.text.y = element_text(size=10, colour='black'),
##D       axis.title.x = element_text(size=10, colour='black'),
##D       strip.text = element_text(size = 10, colour='black'),
##D       axis.title.y= element_text(size=10, angle=0, colour='black'),
##D       strip.text.y = element_text(size = 10, colour='black'),
##D       strip.text.x = element_text(size = 10, colour='black'),
##D       plot.background = element_rect(fill = "white", colour='white'),
##D       panel.grid.major = element_blank(),
##D       panel.background = element_blank(),
##D       strip.background = element_blank(),
##D       axis.line.x = element_line(color = 'black'),
##D       axis.line.y = element_line(color = 'black'))
## End(Not run)



