## ----knitr, include = FALSE----------------------------------------------
library(knitr)
opts_chunk$set(message = FALSE, fig.align = "center",
               fig.width = 7, fig.height = 5)

## ---- message = FALSE----------------------------------------------------
library(dplyr)
library(FactoMineR)
library(forcats)
library(ggplot2)
library(knitr)
library(likert)
library(tidyr)
library(forwards)

## ------------------------------------------------------------------------
tab <- with(useR2016,
            prop.table(table(Q7, Q2), margin = 2))
kable(tab*100, digits = 1)

## ---- message = FALSE, fig.width = 9, out.width = "100%"-----------------
ldat <- likert(useR2016[c("Q15", "Q15_B", "Q15_C", "Q15_D")])
plot(ldat) +
    scale_x_discrete(labels = 
                       rev(c("fun", "considered cool/interesting\n by my peers",
                             "difficult", "monotonous task"))) +
    ggtitle("useR! 2016 attendees' opinions on writing R")

## ------------------------------------------------------------------------
dat <- useR2016 %>%
    filter(Q2 %in% c("Men", "Women")) %>%
    select(Q2, Q24, Q24_B, Q24_C, Q24_D, Q24_E, Q24_F, Q24_G, Q24_H, Q24_I, 
           Q24_J, Q24_K, Q24_L) %>%
    group_by(Q2) %>%
    summarize_all(funs(Yes = sum(!is.na(.)),
                       No = sum(is.na(.)))) %>%
    gather(Response, Count, -Q2) %>%
    separate(Response, c("Q", "Answer"), sep = "_(?=[^_]+$)") %>%
    arrange(Q2, Q, Answer) %>%
    group_by(Q2, Q) %>%
    summarize(Yes = Count[2],
              Percentage = Count[2]/sum(Count) * 100) %>%
    filter(Yes > 4) %>%
    mutate(Q = factor(Q, labels = 
                        c("New R user group near me",#A
                          "New R user group near me aimed at my demographic",#B
                          "Free local introductory R workshops",#C
                          "Paid local advanced R workshops",#D
                          "R workshop at conference in my domain", #E
                          "R workshop aimed at my demographic",#F
                          "Mentoring (e.g. CRAN/useR! submission, GitHub contribution)", #G
                          #"Training in non-English language",
                          #"Training that accommodates my disability",
                          "Online forum to discuss R-related issues", #J
                          "Online support group for my demographic"#, #K
                          #"Special facilities at R conferences"
                          ))) 
kable(dat, digits = 1)

## ---- fig.width = 9, out.width = 7, out.width = "100%"-------------------
ggplot(dat, aes(x = fct_rev(Q),  y = Percentage, fill = Q2)) + 
  geom_bar(stat = "identity", position = "dodge") +
  coord_flip() +
  labs(x = NULL, y = "%", title = "R programming level of useR! 2016 attendees", fill = NULL) +
  scale_y_continuous(breaks = seq(0, 100, 20), limits = c(0, 100)) +
  scale_fill_hue(h = c(110,250), direction = -1, breaks = c("Women", "Men"))

## ------------------------------------------------------------------------
response <- with(useR2016,
    ifelse(!is.na(Q13_D) | !is.na(Q13_E) | !is.na(Q13_F), 1, 0))
summary(glm(response ~ Q2 + Q11 + Q8 + Q18, data = useR2016))

## ---- fig.height = 7-----------------------------------------------------
demo <- c("Q2", "Q3", "Q7", "Q8")
suppl <- c(demo, "Q12")
ruses <- c("Q11", "Q13", "Q13_B", "Q13_C", "Q13_D", "Q13_E", "Q13_F", "Q14")
don.mca <- useR2016[, c(suppl, ruses)] %>%
    mutate(Q12 = factor(ifelse(Q12 == "Yes", "prg_exp_yes", "prg_exp_no")),
           Q13 = factor(ifelse(!is.na(Q13), "use_func_yes", "use_func_no")),
           Q13_B = factor(ifelse(!is.na(Q13_B), "wrt_code_yes", "wrt_code_no")),
           Q13_C = factor(ifelse(!is.na(Q13_C), "wrt_func_yes", "wrt_func_no")),
           Q13_D = factor(ifelse(!is.na(Q13_D), "ctb_pkg_yes", "ctb_pkg_no")),
           Q13_E = factor(ifelse(!is.na(Q13_E), "wrt_pkg_yes", "wrt_pkg_no")),
           Q13_F = factor(ifelse(!is.na(Q13_F), "rel_pkg_yes", "wrt_rel_no")))
rownames(don.mca) <- seq(nrow(don.mca))
res.mca <- MCA(don.mca, graph =  FALSE, quali.sup =  seq(length(suppl)))
plot(res.mca, invisible = c("ind", "quali.sup"), cex = 0.8)

## ---- fig.height = 7-----------------------------------------------------
res.dimdesc <- dimdesc(res.mca)  
# demographic variables linked to the dimension 1 or 2 
varselect <- 
    demo[which(demo%in%unique(c(rownames(res.dimdesc$'Dim 1'$quali),
                                rownames(res.dimdesc$'Dim 2'$quali))))]
# vector with the categories for such demographic variables
modeselect <- unlist(sapply(don.mca[, varselect],levels))      
# discriminant categories for the position of the individuals on dimension 1 or 2
modeselect <- modeselect[modeselect%in%unique(c(rownames(res.dimdesc$'Dim 1'$category),
                                                rownames(res.dimdesc$'Dim 2'$category)))]
plot(res.mca, invisible=c("ind", "var"), cex = 0.8,
     selectMod = modeselect, autoLab = "yes",
     xlim = c(-1.5,1.5), ylim = c(-1,1))

