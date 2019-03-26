library(extracat)


### Name: rmb
### Title: Multiple Barchart for relative frequencies and generalized
###   Spineplots
### Aliases: rmb rmb.formula rmb.table rmb.ftable rmb.glm

### ** Examples

  require(MASS)
    # simple example
    rmb(formula = ~Type+Infl+Cont+Sat, data = housing, gap.mult = 2,
        col.vars = c(FALSE,TRUE,TRUE,FALSE), label.opt = list(abbrev = 3))
    
    # with sqrt-transformation and horizontal splits only
    rmb(formula = ~Type+Infl+Cont+Sat, data = housing, gap.mult = 2,
        col.vars = c(TRUE,TRUE,TRUE,TRUE), freq.trans = "sqrt",
           label.opt = list(abbrev = 3) )
    
    # a generalized spineplot with the first category highlighted
    rmb(formula = ~Type+Infl+Cont+Sat, data = housing, spine = TRUE, 
        cat.ord = 1, mult = 2, col.vars = c(1,3,4), 
        freq.trans = list("sqrt",3),  label.opt = list(abbrev = 2))
  ## Not run: 
##D   
##D     # a generalized spineplot with all categories highlighted 
##D     # in a changed order
##D     rmb(formula = ~Type+Infl+Cont+Sat, data = housing, spine = TRUE,
##D         cat.ord = c(3,1,2), gap.mult = 2, col.vars = c(TRUE,FALSE,TRUE,TRUE),
##D         freq.trans = "sqrt",  label.opt = list(abbrev = 3))
##D     
##D     # the barchart version only for categories 1 and 3
##D     rmb(formula = ~Type+Infl+Cont+Sat, data = housing, 
##D         cat.ord = c(1,3), gap.mult = 2, col.vars = c(TRUE,FALSE,TRUE,TRUE),
##D         freq.trans = "sqrt",  label.opt = list(abbrev = c(4,1,1,1)))
##D         
##D         
##D     # with equal widths
##D     rmb(formula = ~Type+Infl+Cont+Sat, data = housing, eqwidth = TRUE,
##D         gap.mult = 2, col.vars = c(TRUE,FALSE,TRUE,TRUE), 
##D          label.opt = list(abbrev = 2, lab.tv = TRUE))
##D     
##D     # ----- models and residuals ----- #
##D     # using the logistic model: Sat by Type only
##D     
##D     #   residual shadings and expected values
##D     rmb(formula = ~Type+Infl+Cont+Sat, data = housing,
##D         gap.mult = 2, col.vars = c(TRUE,FALSE,TRUE,TRUE), 
##D         label.opt = list(abbrev = 3), expected = list(c(1,2,3),c(1,4)),
##D         model.opt = list(use.expected.values = TRUE, resid.display = "color") )
##D        
##D     #   residual values without shadings
##D     rmb(formula = ~Type+Infl+Cont+Sat, data = housing,
##D         gap.mult = 2, col.vars = c(TRUE,FALSE,TRUE,TRUE), 
##D         label.opt = list(abbrev = 3), expected = list(c(1,2,3),c(1,4)),
##D         model.opt = list( resid.display = "values") )
##D     
##D     #   residual shadings and expected values
##D     rmb(formula = ~Type+Infl+Cont+Sat, data = housing,
##D         gap.mult = 2, col.vars = c(TRUE,FALSE,TRUE,TRUE), 
##D         label.opt = list(abbrev = 3), expected = list(c(1,2,3),c(1,4)),
##D         model.opt = list(use.expected.values = TRUE, resid.display = "color") )
##D    
##D     #   barcharts with residual shadings and values
##D     rmb(formula = ~Type+Infl+Cont+Sat, data = housing,
##D         gap.mult = 2, col.vars = c(TRUE,FALSE,TRUE,TRUE), 
##D         label.opt = list(abbrev = 3), expected = list(c(1,2,3),c(1,4)) )
##D         
##D     #   spineplots with residual shadings and values 
##D     rmb(formula = ~Type+Infl+Cont+Sat, data = housing, spine = TRUE,
##D         gap.mult = 2, col.vars = c(TRUE,FALSE,TRUE,TRUE), 
##D         label.opt = list(abbrev = 3), expected = list(c(1,2,3),c(1,4)) )
##D         
##D     #   piecharts with residual shadings and values
##D     rmb(formula = ~Type+Infl+Cont+Sat, data = housing, circular = TRUE,
##D         gap.mult = 2, col.vars = c(TRUE,FALSE,TRUE,TRUE), 
##D         label.opt = list(abbrev = 3), expected = list(c(1,2,3),c(1,4)) )
##D         
##D      # ----- using an ftable to create the plot ----- #
##D      tt = xtabs(Freq~Type+Cont+Infl+Sat, data = housing)
##D      ft = ftable(tt, col.vars= c(1,4))
##D       rmb(tt)
##D       rmb(ft)
##D 
##D     # ----- using a glm model ----- #
##D     mod1 <- glm(Freq ~ Type*Infl*Cont + Type*Sat, data = housing, family = poisson)
##D     rmb(mod1, circular = TRUE,
##D         gap.mult = 2, col.vars = c(TRUE,FALSE,TRUE,TRUE), 
##D         label.opt = list(abbrev = 3), model.opt = list(use.expected.values = TRUE) )
##D         
##D         
##D       # ----- the numeric mode and cuts ----- #   
##D      data(olives)
##D      # only three cuts to show how it works
##D      rmb(~palmitoleic+stearic+Region, data = olives, cut = c(3,3,0))
##D      
##D      require(ggplot2)
##D      data(diamonds)
##D      diamonds$lprice <- log(diamonds$price)
##D      # a minority of extreme observations mess the display up:
##D      rmb(~depth+table+lprice, data = diamonds, eqwidth = TRUE, spine = TRUE, 
##D      cut = c(36,36,5), col = "seq", num.mode = TRUE)
##D      
##D      # we can zoom in via innerval:
##D       rmb(~depth+table+lprice, data = diamonds,  circular = TRUE, 
##D       cut = c(36,36,5), col = "div", innerval = 0.95, 
##D       num.mode = TRUE, freq.trans ="log")
##D       
##D            # price, carat and color
##D         diamonds$lprice <- log(diamonds$price)
##D         diamonds$lcarat <- log(diamonds$carat)     
##D       rmb(~lcarat+lprice+color, data = diamonds,
##D       cut = c(24,24,0), col = "rgb", num.mode = TRUE,
##D        freq.trans="sqrt", eqwidth=TRUE, max.scale=0.5)
##D        
## End(Not run)



