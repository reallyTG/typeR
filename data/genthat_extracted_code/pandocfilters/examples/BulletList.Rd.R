library(pandocfilters)


### Name: BulletList
### Title: Bullet List
### Aliases: BulletList

### ** Examples

bullet_1 <- Plain("A")
bullet_2 <- Plain(Str("B"))
bullet_3 <- list(Plain(list(Str("C"))))
BulletList(list(bullet_1, bullet_2, bullet_3))



