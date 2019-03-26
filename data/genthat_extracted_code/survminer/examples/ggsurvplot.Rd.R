library(survminer)


### Name: ggsurvplot
### Title: Drawing Survival Curves Using ggplot2
### Aliases: ggsurvplot print.ggsurvplot

### ** Examples


#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Example 1: Survival curves with two groups
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# Fit survival curves
#++++++++++++++++++++++++++++++++++++
require("survival")
fit<- survfit(Surv(time, status) ~ sex, data = lung)

# Basic survival curves
ggsurvplot(fit, data = lung)

# Customized survival curves
ggsurvplot(fit, data = lung,
 surv.median.line = "hv", # Add medians survival

 # Change legends: title & labels
 legend.title = "Sex",
 legend.labs = c("Male", "Female"),
 # Add p-value and tervals
 pval = TRUE,

 conf.int = TRUE,
 # Add risk table
 risk.table = TRUE,
 tables.height = 0.2,
 tables.theme = theme_cleantable(),

 # Color palettes. Use custom color: c("#E7B800", "#2E9FDF"),
 # or brewer color (e.g.: "Dark2"), or ggsci color (e.g.: "jco")
 palette = c("#E7B800", "#2E9FDF"),
 ggtheme = theme_bw() # Change ggplot2 theme
)

# Change font size, style and color
#++++++++++++++++++++++++++++++++++++
## Not run: 
##D # Change font size, style and color at the same time
##D ggsurvplot(fit, data = lung,  main = "Survival curve",
##D    font.main = c(16, "bold", "darkblue"),
##D    font.x = c(14, "bold.italic", "red"),
##D    font.y = c(14, "bold.italic", "darkred"),
##D    font.tickslab = c(12, "plain", "darkgreen"))
## End(Not run)



#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Example 2: Facet ggsurvplot() output by
# a combination of factors
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# Fit (complexe) survival curves
#++++++++++++++++++++++++++++++++++++
## Not run: 
##D require("survival")
##D fit3 <- survfit( Surv(time, status) ~ sex + rx + adhere,
##D                 data = colon )
##D 
##D # Visualize
##D #++++++++++++++++++++++++++++++++++++
##D ggsurv <- ggsurvplot(fit3, data = colon,
##D   fun = "cumhaz", conf.int = TRUE,
##D   risk.table = TRUE, risk.table.col="strata",
##D   ggtheme = theme_bw())
##D 
##D # Faceting survival curves
##D curv_facet <- ggsurv$plot + facet_grid(rx ~ adhere)
##D curv_facet
##D 
##D # Faceting risk tables:
##D # Generate risk table for each facet plot item
##D ggsurv$table + facet_grid(rx ~ adhere, scales = "free")+
##D  theme(legend.position = "none")
##D 
##D  # Generate risk table for each facet columns
##D tbl_facet <- ggsurv$table + facet_grid(.~ adhere, scales = "free")
##D tbl_facet + theme(legend.position = "none")
##D 
##D # Arrange faceted survival curves and risk tables
##D g2 <- ggplotGrob(curv_facet)
##D g3 <- ggplotGrob(tbl_facet)
##D min_ncol <- min(ncol(g2), ncol(g3))
##D g <- gridExtra::rbind.gtable(g2[, 1:min_ncol], g3[, 1:min_ncol], size="last")
##D g$widths <- grid::unit.pmax(g2$widths, g3$widths)
##D grid::grid.newpage()
##D grid::grid.draw(g)
##D 
## End(Not run)

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Example 3: CUSTOMIZED PVALUE
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Customized p-value
ggsurvplot(fit, data = lung, pval = TRUE)
ggsurvplot(fit, data = lung, pval = 0.03)
ggsurvplot(fit, data = lung, pval = "The hot p-value is: 0.031")




