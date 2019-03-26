library(MSG)


### Name: gov.cn.pct
### Title: Percentage data in Chinese government websites
### Aliases: gov.cn.pct

### ** Examples

data(gov.cn.pct)
pct.lowess = function(cond) {
    with(gov.cn.pct, {
        plot(count ~ percentage, pch = ifelse(cond, 4, 20), col = rgb(0:1, 
            0, 0, c(0.04, 0.5))[cond + 1], log = "y")
        lines(lowess(gov.cn.pct[cond, 1:2], f = 1/3), col = 2, lwd = 2)
        lines(lowess(gov.cn.pct[!cond, 1:2], f = 1/3), col = 1, lwd = 2)
    })
}
par(mar = c(3.5, 3.5, 1, 0.2), mfrow = c(2, 2))
with(gov.cn.pct, {
    plot(percentage, count, type = "l", panel.first = grid())
    plot(percentage, count, type = "l", xlim = c(10, 11), panel.first = grid())
    pct.lowess(round0)
    pct.lowess(round1)
})
if (interactive()) {
    devAskNewPage(ask = TRUE)
    
    with(gov.cn.pct, {
        plot(count ~ percentage, type = "l")
        grid()
        
        devAskNewPage(ask = FALSE)
        
        for (i in 0:99) {
            plot(count ~ percentage, type = "l", xlim = i + c(0, 1), 
                panel.first = grid())
        }
        
        devAskNewPage(ask = TRUE)
        
        plot(count ~ percentage, pch = 20, col = rgb(0:1, 0, 0, c(0.07, 
            1))[round0 + 1], log = "y")
        lines(lowess(gov.cn.pct[round0, 1:2], f = 1/3), col = "red", 
            lwd = 2)
        lines(lowess(gov.cn.pct[!round0, 1:2], f = 1/3), col = "black", 
            lwd = 2)
        
        plot(count ~ percentage, pch = 20, col = rgb(0:1, 0, 0, c(0.07, 
            1))[round1 + 1], log = "y")
        lines(lowess(gov.cn.pct[round1, 1:2], f = 1/3), col = "red", 
            lwd = 2)
        lines(lowess(gov.cn.pct[!round1, 1:2], f = 1/3), col = "black", 
            lwd = 2)
    })
}



