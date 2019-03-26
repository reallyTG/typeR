library(SubgrPlots)


### Name: subgroupset
### Title: UpSetR Plot with treatment effects
### Aliases: subgroupset

### ** Examples

## No test: 
data(prca)
dat <- prca
vars = data.frame(variable = names(dat), index = 1:length(names(dat)))

## 12. SubgroUpSet -----------------------------------------------------------
prca.upset = data.frame(trt = factor(ifelse(prca$rx == 1, "Experimental", "Control")),
                        bm = 1*(prca$bm == 1),
                        pf = 1*(prca$pf == 1),
                        hx = 1*(prca$hx == 1),
                        stage = 1*(prca$stage == 4),
                        age = 1*(prca$age > 75),
                        wt = 1*(prca$weight > 100),
                        survtime = prca$survtime,
                        cens = prca$cens==1)
subgroupset(prca.upset,
            order.by = "freq",
            empty.intersections = "on",
            sets = c("bm", 'pf', "hx"),
            text.scale = 1.,
            mb.ratio = c(0.25, 0.50,0.20),
            treatment.var = "trt",
            outcome.type = "survival",
            effects.summary = c("survtime", "cens"),
            query.legend = "top", icon = "pm")

subgroupset(prca.upset,
            order.by = "freq",
            empty.intersections = "on",
            sets = c("bm", 'pf', "hx"),
            text.scale = 1.,
            mb.ratio = c(0.25, 0.50,0.20),
            treatment.var = "trt",
            outcome.type = "survival",
            effects.summary = c("survtime", "cens"),
            query.legend = "top", icon = "pm", transpose = TRUE)
## End(No test)




