library(OPDOE)


### Name: size_n.three_way
### Title: Design for Three-Way ANOVA
### Aliases: 'size_n.three_way_cross.model_1_a '
###   'size_n.three_way_cross.model_1_axb '
###   'size_n.three_way_cross.model_1_axbxc '
###   'size_n.three_way_mixed_ab_in_c.model_1_a '
###   size_n.three_way_mixed_ab_in_c.model_1_axb
###   'size_n.three_way_mixed_ab_in_c.model_1_b '
###   'size_n.three_way_mixed_ab_in_c.model_1_c '
###   'size_n.three_way_mixed_ab_in_c.model_3_c '
###   'size_n.three_way_mixed_ab_in_c.model_4_c '
###   'size_n.three_way_mixed_cxbina.model_1_a '
###   'size_n.three_way_mixed_cxbina.model_1_axc '
###   'size_n.three_way_mixed_cxbina.model_1_b '
###   'size_n.three_way_mixed_cxbina.model_1_bxc '
###   'size_n.three_way_mixed_cxbina.model_1_c '
###   'size_n.three_way_mixed_cxbina.model_3_b '
###   'size_n.three_way_mixed_cxbina.model_3_bxc '
###   'size_n.three_way_nested.model_1_a '
###   'size_n.three_way_nested.model_1_b '
###   'size_n.three_way_nested.model_1_c '
###   'size_n.three_way_nested.model_3_b '
###   'size_n.three_way_nested.model_3_c '
###   'size_n.three_way_nested.model_4_a '
###   'size_n.three_way_nested.model_8_c '
### Keywords: anova

### ** Examples

size_n.three_way_cross.model_1_a(0.05, 0.1, 0.5, 6, 5, 4, "maximin")
size_n.three_way_cross.model_1_a(0.05, 0.1, 0.5, 6, 5, 4, "minimin")
size_n.three_way_cross.model_1_axb(0.05, 0.1, 0.5, 6, 5, 4, "maximin")
size_n.three_way_cross.model_1_axb(0.05, 0.1, 0.5, 6, 5, 4, "minimin")
size_n.three_way_cross.model_1_axbxc(0.05, 0.1, 0.5, 6, 5, 4, "maximin")
size_n.three_way_cross.model_1_axbxc(0.05, 0.1, 0.5, 6, 5, 4, "minimin")
size_n.three_way_mixed_ab_in_c.model_1_a(0.05, 0.1, 0.5, 6, 5, 4, "maximin")
size_n.three_way_mixed_ab_in_c.model_1_a(0.05, 0.1, 0.5, 6, 5, 4, "minimin")
size_n.three_way_mixed_ab_in_c.model_1_axb(0.05, 0.1, 0.5, 6, 5, 4, "maximin")
size_n.three_way_mixed_ab_in_c.model_1_axb(0.05, 0.1, 0.5, 6, 5, 4, "minimin")
size_n.three_way_mixed_ab_in_c.model_1_b(0.05, 0.1, 0.5, 6, 5, 4, "maximin")
size_n.three_way_mixed_ab_in_c.model_1_b(0.05, 0.1, 0.5, 6, 5, 4, "minimin")
size_n.three_way_mixed_ab_in_c.model_1_c(0.05, 0.1, 0.5, 6, 5, 4, "maximin")
size_n.three_way_mixed_ab_in_c.model_1_c(0.05, 0.1, 0.5, 6, 5, 4, "minimin")
size_n.three_way_mixed_ab_in_c.model_3_c(0.05, 0.1, 0.5, 6, 5, 4, "maximin")
size_n.three_way_mixed_ab_in_c.model_3_c(0.05, 0.1, 0.5, 6, 5, 4, "minimin")
size_n.three_way_mixed_ab_in_c.model_4_c(0.05, 0.1, 0.5, 6, 5, 4, "maximin")
size_n.three_way_mixed_ab_in_c.model_4_c(0.05, 0.1, 0.5, 6, 5, 4, "minimin")
size_n.three_way_mixed_cxbina.model_1_a(0.05, 0.1, 0.5, 6, 5, 4, "maximin")
size_n.three_way_mixed_cxbina.model_1_a(0.05, 0.1, 0.5, 6, 5, 4, "minimin")
size_n.three_way_mixed_cxbina.model_1_axc(0.05, 0.1, 0.5, 6, 5, 4, "maximin")
size_n.three_way_mixed_cxbina.model_1_axc(0.05, 0.1, 0.5, 6, 5, 4, "minimin")
size_n.three_way_mixed_cxbina.model_1_b(0.05, 0.1, 0.5, 6, 5, 4, "maximin")
size_n.three_way_mixed_cxbina.model_1_b(0.05, 0.1, 0.5, 6, 5, 4, "minimin")
size_n.three_way_mixed_cxbina.model_1_bxc(0.05, 0.1, 0.5, 6, 5, 4, "maximin")
size_n.three_way_mixed_cxbina.model_1_bxc(0.05, 0.1, 0.5, 6, 5, 4, "minimin")
size_n.three_way_mixed_cxbina.model_1_c(0.05, 0.1, 0.5, 6, 5, 4, "maximin")
size_n.three_way_mixed_cxbina.model_1_c(0.05, 0.1, 0.5, 6, 5, 4, "minimin")
size_n.three_way_mixed_cxbina.model_3_b(0.05, 0.1, 0.5, 6, 5, 4, "maximin")
size_n.three_way_mixed_cxbina.model_3_b(0.05, 0.1, 0.5, 6, 5, 4, "minimin")
size_n.three_way_mixed_cxbina.model_3_bxc (0.05, 0.1, 0.5, 6, 5, 4, "maximin")
size_n.three_way_mixed_cxbina.model_3_bxc (0.05, 0.1, 0.5, 6, 5, 4, "minimin")
size_n.three_way_nested.model_1_a(0.05, 0.1, 0.5, 6, 5, 4, "maximin")
size_n.three_way_nested.model_1_a(0.05, 0.1, 0.5, 6, 5, 4, "minimin")
size_n.three_way_nested.model_1_b(0.05, 0.1, 0.5, 6, 5, 4, "maximin")
size_n.three_way_nested.model_1_b(0.05, 0.1, 0.5, 6, 5, 4, "minimin")
size_n.three_way_nested.model_1_c(0.05, 0.1, 0.5, 6, 5, 4, "maximin")
size_n.three_way_nested.model_1_c(0.05, 0.1, 0.5, 6, 5, 4, "minimin")
size_n.three_way_nested.model_3_b(0.05, 0.1, 0.5, 6, 5, 4, "maximin")
size_n.three_way_nested.model_3_b(0.05, 0.1, 0.5, 6, 5, 4, "minimin")
size_n.three_way_nested.model_3_c(0.05, 0.1, 0.5, 6, 5, 4, "maximin")
size_n.three_way_nested.model_3_c(0.05, 0.1, 0.5, 6, 5, 4, "minimin")
size_n.three_way_nested.model_4_c(0.05, 0.1, 0.5, 6, NA, 4, "maximin")
size_n.three_way_nested.model_4_c(0.05, 0.1, 0.5, 6, NA, 4, "minimin")
size_n.three_way_nested.model_8_c(0.05, 0.1, 0.5, 6, 5, 4, "maximin")
size_n.three_way_nested.model_8_c(0.05, 0.1, 0.5, 6, 5, 4, "minimin")




