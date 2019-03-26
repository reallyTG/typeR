library(tkrgl)


### Name: spinControl
### Title: Create a spin control in a TCL/TK window
### Aliases: spinControl
### Keywords: dynamic

### ** Examples

if (interactive()) { 
    library(rgl)
    library(tcltk)
    open3d()
    win1 <- rgl.cur()
    rgl.bringtotop(TRUE)
    plot3d(rexp(100), rexp(100), rexp(100), size=3, col='green')
    
    open3d()
    win2 <- rgl.cur()
    rgl.bringtotop(TRUE)
    plot3d(rt(100,2), rt(100,2), rt(100, 2), size=3, col='yellow')
    
    open3d()
    win3 <- rgl.cur()
    rgl.bringtotop(TRUE)
    plot3d(rexp(100), rexp(100), rexp(100), size=3, col='red')
        
    open3d()
    win4 <- rgl.cur()
    rgl.bringtotop(TRUE)
    plot3d(rbinom(100,10,0.5), rbinom(100,10,0.5), rbinom(100,10,0.5), size=3, col='cyan')
    
    base <- tktoplevel()
    tkwm.title(base, "Spinners")
    con1 <- spinControl(base, dev=c(win1,win2))
    con2 <- spinControl(base, dev=c(win3,win4))
    tkpack(con1, con2)
}



