library(Momocs)


### Name: rm_asym
### Title: Removes asymmetric and symmetric variation on OutCoe objects
### Aliases: rm_asym rm_sym rm_asym.default rm_asym.OutCoe rm_sym
###   rm_sym.default rm_sym.OutCoe

### ** Examples

botf <- efourier(bot, 12)
botSym <- rm_asym(botf)
boxplot(botSym)
botSymp <- PCA(botSym)
plot(botSymp)
plot(botSymp, amp.shp=5)

# Asymmetric only
botAsym <- rm_sym(botf)
boxplot(botAsym)
botAsymp <- PCA(botAsym)
plot(botAsymp)
# strange shapes because the original shape was mainly symmetric and would need its
# symmetric (eg its average) for a proper reconstruction. Should only be used like that:
plot(botAsymp, morpho=FALSE)



