library(dprint)


### Name: style
### Title: Style Sheet
### Aliases: style

### ** Examples

# My Style
# Default, this is what is used in dprint if style parameter is not defined
style()
# Save style sheet formats in object to pass to multiple calls
CBs <- style(frmt.bdy=frmt(fontfamily="HersheySans"), frmt.tbl=frmt(bty="o", lwd=1),
            frmt.col=frmt(fontfamily="HersheySans", bg="khaki", fontface="bold",lwd=2,bty="_"),
            frmt.grp=frmt(fontfamily="HersheySans",bg="khaki", fontface="bold"),
            frmt.main=frmt(fontfamily="HersheySans", fontface="bold", fontsize=12),
            frmt.ftn=frmt(fontfamily="HersheySans"),
            justify="right")



