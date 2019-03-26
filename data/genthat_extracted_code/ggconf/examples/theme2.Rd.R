library(ggconf)


### Name: theme2
### Title: an enhanced version of ggplot2::theme()
### Aliases: theme2

### ** Examples


if (requireNamespace("ggplot2", quietly = TRUE)) {

library(ggplot2)
ggplot(mtcars) + geom_point(aes(wt, hp, color=as.factor(cyl))) +
  theme2(
    text(f="bold", z=24, fmly="Times New Roman"),
    pnl.bg(fill="white"),
    lgd.box.margin(.2, .2, .2, .2, "cm"),
    lgd.box.bg(c="black"),
    lgd.key(fill="white"),
    lgd.position("bottom"),
    lgd.txt(z=rel(.8)),
    lgd.title(fmly="Consolas", c="royalblue"),  
    axs.title(fmly="Consolas", c="royalblue"),  
    axs.title.y(angle=0, vjust=.5),             
    axs.txt(z=rel(1.1)),
    axs.line(arrow=arrow(type="open", angle=20), z=2),
    axs.tick(z=1),                              
    axs.tick.len(.5, "cm"),
    plt.subttl(f="plain", hjust=1),
    plt.margin(.3, .3, .3, .1, "inch")          
  )


ggplot(mtcars) + geom_point(aes(wt, hp, color=cyl)) +
   theme2(a.txt(family = c("Consolas", "Times")[1]))

# all of the following three generate the same plot

ggplot(mtcars) + geom_point(aes(wt, hp, color=cyl)) +
   theme(text = element_text(size=20, face="bold"),
   axis.line = element_line(size=2),
   legend.key = element_rect(color="black"))

ggplot(mtcars) + geom_point(aes(wt, hp, color=cyl)) +
   theme2(text(size=20, face="bold"), axis.line(size=2),
          legend.key(color="black"))

ggplot(mtcars) + geom_point(aes(wt, hp, color=cyl)) +
   theme2(txt(sz=20, f="bold"), aline(sz=2), l.key(c="black"))



}





