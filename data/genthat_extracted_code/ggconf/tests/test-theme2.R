context("theme2")
library(ggplot2)

test_that("theme2", {

    tdf <- define_ggconf_constants()$themedf

    ee(theme2(axis.text(sz=20), text(f="bold")),
       theme(axis.text = element_text(size=20),
             text = element_text(face="bold")))

    ggplot(mtcars) + geom_point(aes(mpg, wt)) +
    theme(axis.text = element_text(size=20, face="bold"),
          axis.line = element_line(color = "black"))
    theme2(axis.text(size=20, face="bold"), axis.line(color="black"))

    # spaces under depth 2
    ee(theme2(title(family="Times New Roman")),
       theme(title = element_text(family="Times New Roman")))

    ee(theme2(l.bg(fill="red"), l.mgn(.5, .5, .5, .2, "inch")),
       theme(legend.background = element_rect(fill="red"),
             legend.margin = margin(.5, .5, .5, .2, "inch")))

    ee(theme2(axis.line(arrow=arrow(angle=30))),
        theme(axis.line = element_line(arrow=arrow())))
    ee(theme2(axis.line(arrow=arrow(angle=30, ends="last",
                                    type="open", length = unit(.25, "inches")))),
        theme(axis.line =
                  element_line(arrow=arrow(angle=30, ends="last",
                                           type="open",
                                           length = unit(.25, "inches")))))

    ee(theme2(a.txt(z=rel(1.0))),
       theme(axis.text = element_text(size=rel(1.0))))

    fullset <-
        theme2(
            text(f="bold", z=24, fmly="Times New Roman"),      # make all text thicker/larger
            pnl.bg(fill="white"),
            lgd.box.margin(.2, .2, .2, .2, "cm"),
            lgd.box.bg(c="black"),
            lgd.key(fill="white"),
            lgd.position("bottom"),
            lgd.txt(z=rel(.8)),
            lgd.title(fmly="Consolas", c="royalblue"),         # equally-spaced font
            axs.title(fmly="Consolas", c="royalblue"),         # colorize axis titles
            axs.title.y(angle=0, vjust=.5),                    # rotate and centerize y axis label
            axs.txt(z=rel(1.1)),
            axs.line(arrow=arrow(type="open", angle=20), z=2), #
            axs.tick(z=1),                                     # tick or ticks? It doesn't matter
            axs.tick.len(.5, "cm"),
            plt.subttl(f="plain", hjust=1),
            plt.margin(.3, .3, .3, .1, "inch")                # adjust margins
        )

    fullset_ggplot <-
    theme(
        text = element_text(face="bold", size=24, family="Times New Roman"),
        panel.background = element_rect(fill="white"),
        legend.box.margin = margin(0.2,0.2,0.2,0.2,"cm"),
        legend.box.background = element_rect(colour="black"),
        legend.key = element_rect(fill="white"),
        legend.position = "bottom",
        legend.text = element_text(size=rel(0.8)),
        legend.title = element_text(family="Consolas", colour="royalblue"),
        axis.title = element_text(family="Consolas", colour="royalblue"),
        axis.title.y = element_text(angle=0, vjust=0.5),
        axis.text = element_text(size=rel(1.1)),
        axis.line = element_line(arrow=arrow(type="open",angle=20), size=2),
        axis.ticks = element_line(size=1),
        axis.ticks.length = grid::unit(0.5,"cm"),
        plot.subtitle = element_text(face="plain", hjust=1),
        plot.margin = margin(0.3,0.3,0.3,0.1,"inch")
    )

    ee(fullset, fullset_ggplot)

    ee(suppressMessages(theme2(aaaaaaaaaaa(size=3))), FALSE)
    
    ee(theme2(ax.ttl(col=paste0('sky','blue'))),
       theme(axis.title = element_text(color=paste0('sky','blue'))))
    
    ee(theme2(a.txt(family=c("consolas", "Times New Roman")[1])),
       theme(axis.text = element_text(family="consolas")))
    
    ee(theme2(a.txt(family=c("consolas", "Times New Roman")[2])),
       theme(axis.text = element_text(family="Times New Roman")))
    
    my.se_1_ection <<- 1
    ee(theme2(a.txt(family=c("consolas", "Times New Roman")[my.se_1_ection])),
       theme(axis.text = element_text(family="consolas")))
    
})

test_that("partial-match", {

    tdf <- define_ggconf_constants()$themedf

    # partial to full
    p2f <- function(p) {
        tdf$name[find_first_index(p, tdf$name,
                                  show_warn = FALSE, debug = FALSE)]
    }

    ee(p2f("l"),  "line")
    ee(p2f("t"),  "text") # not rect
    ee(p2f("r"),  "rect")
    ee(p2f("tl"), "title")
    ee(p2f("a.ratio"), "aspect.ratio")
    ee(p2f("a.ttl"), "axis.title")
    ee(p2f("attlx"), "axis.title.x")
    ee(p2f("atly"), "axis.title.y")
    ee(p2f("atlxtop"), "axis.title.x.top")
    ee(p2f("atxt.x.top"), "axis.text.x.top")
    ee(p2f("a.l"), "axis.line")
    ee(p2f("leg.bg"), "legend.background")
    ee(p2f("l.bg"), "legend.background")
    ee(p2f("l.m"), "legend.margin")
    ee(p2f("l.s"), "legend.spacing")
    ee(p2f("l.k"), "legend.key")
    ee(p2f("lk"), "legend.key")
    ee(p2f("l.t"), "legend.text")
    ee(p2f("l.t.a"), "legend.text.align")
    ee(p2f("l.ttl"), "legend.title")
    ee(p2f("l.pos"), "legend.position")
    ee(p2f("l.dir"), "legend.direction")
    ee(p2f("pnl.bg"), "panel.background")
    ee(p2f("pnl.bd"), "panel.border")
    ee(p2f("plot.bg"), "plot.background")
    ee(p2f("s.txt"), "strip.text")
})

test_that("partial-match-conf", {
    
    etext <- get_theme_elem_name_conf("element_text")
    
    # partial to full
    p2conf <- function(p, elem_tbl) {
        elem_tbl[find_first_index(p, elem_tbl,
                                  show_warn = FALSE, debug = FALSE)]
    }

    ee(p2conf("c", etext),  "colour")
    
})

