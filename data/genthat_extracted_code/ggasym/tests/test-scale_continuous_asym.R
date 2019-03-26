context("test-scale_continuous_asym")

test_that("get core aesthetic name", {
    expect_warning(get_core_aes("not_real"),
                   regexp = "core aesthetic not found")
    expect_true(is.na(suppressWarnings(get_core_aes("not_real"))))
    expect_equal(get_core_aes("color"), "color")
    expect_equal(get_core_aes("colour"), "colour")
    expect_equal(get_core_aes("fill"), "fill")
    expect_equal(get_core_aes("fill_tl"), "fill")
    expect_equal(get_core_aes("fill_br"), "fill")
    expect_equal(get_core_aes("fill_diag"), "fill")
    expect_equal(get_core_aes("color_tl"), "color")
    expect_equal(get_core_aes("color_br"), "color")
    expect_equal(get_core_aes("color_diag"), "color")
    expect_equal(get_core_aes("colour_tl"), "colour")
    expect_equal(get_core_aes("colour_br"), "colour")
    expect_equal(get_core_aes("colour_diag"), "colour")
})

test_that("scale_fill_tl/br/diag_gradient values populate properly", {
    tib <- data.frame(grp1 = c("A", "A", "B", "A", "B", "C"),
                      grp2 = c("B", "C", "C", "A", "B", "C"),
                      val_1 = c(1, 2, NA),
                      val_2 = c(-1, 0, 1),
                      val_3 = c(NA, NA, NA, 0, 1, 2))
    tib <- asymmetrise(tib, grp1, grp2)
    g1 <- ggplot(tib, aes(x = grp1, y = grp2)) +
        geom_asymmat(aes(fill_tl = val_1, fill_br = val_2, fill_diag = val_3)) +
        scale_fill_tl_gradient(low = "lightpink", high = "red", na.value = "green")
    g2 <- g1 +
        scale_fill_br_gradient(low = "lightblue1", high = "dodgerblue", na.value = "orange")

    g3 <- g2 +
        scale_fill_diag_gradient(low = "yellow", high = "orange")


    g1_build <- ggplot2::ggplot_build(g1)
    g2_build <- ggplot2::ggplot_build(g2)
    g3_build <- ggplot2::ggplot_build(g3)

    expect_equal(g1$scales$n(), 1)
    expect_true(g1$scales$has_scale("fill_tl"))
    expect_false(g1$scales$has_scale("fill_br"))
    expect_false(g1$scales$has_scale("fill_diag"))
    expect_equal(g2$scales$n(), 2)
    expect_true(g2$scales$has_scale("fill_tl"))
    expect_true(g2$scales$has_scale("fill_br"))
    expect_false(g2$scales$has_scale("fill_diag"))
    expect_equal(g3$scales$n(), 3)
    expect_true(g3$scales$has_scale("fill_tl"))
    expect_true(g3$scales$has_scale("fill_br"))
    expect_true(g3$scales$has_scale("fill_diag"))

    tl_cols <- c("#FFB6C1", "#FF0000", "green")
    br_cols <- c("#BFEFFF", "#86BEFF", "#1E90FF")
    diag_cols <- c("#FFFF00", "#FFD300", "#FFA500", "#FFFF00",
                   "#FFD300", "#FFA500")

    # g1_build
    expect_equal(g1_build$data[[1]]$fill_tl, tl_cols)
    expect_true(all(is.na(g1_build$data[[1]]$fill_br)))
    expect_true(all(is.na(g1_build$data[[1]]$fill_diag)))

    expect_true(all(is.na(g1_build$data[[2]]$fill_tl)))
    expect_false(all(is.na(g1_build$data[[2]]$fill_br)))
    expect_true(all(is.na(g1_build$data[[2]]$fill_diag)))

    expect_true(all(is.na(g1_build$data[[3]]$fill_tl)))
    expect_true(all(is.na(g1_build$data[[3]]$fill_br)))
    expect_false(all(is.na(g1_build$data[[3]]$fill_diag)))


    # g2_build
    expect_equal(g2_build$data[[1]]$fill_tl, tl_cols)
    expect_true(all(is.na(g2_build$data[[1]]$fill_br)))
    expect_true(all(is.na(g2_build$data[[1]]$fill_diag)))

    expect_true(all(is.na(g2_build$data[[2]]$fill_tl)))
    expect_equal(g2_build$data[[2]]$fill_br, br_cols)
    expect_true(all(is.na(g2_build$data[[2]]$fill_diag)))

    expect_true(all(is.na(g2_build$data[[3]]$fill_tl)))
    expect_true(all(is.na(g2_build$data[[3]]$fill_br)))
    expect_false(all(is.na(g2_build$data[[3]]$fill_diag)))

    # g3_build
    expect_equal(g3_build$data[[1]]$fill_tl, tl_cols)
    expect_true(all(is.na(g3_build$data[[1]]$fill_br)))
    expect_true(all(is.na(g3_build$data[[1]]$fill_diag)))

    expect_true(all(is.na(g3_build$data[[2]]$fill_tl)))
    expect_equal(g3_build$data[[2]]$fill_br, br_cols)
    expect_true(all(is.na(g3_build$data[[2]]$fill_diag)))

    expect_true(all(is.na(g3_build$data[[3]]$fill_tl)))
    expect_true(all(is.na(g3_build$data[[3]]$fill_br)))
    expect_equal(g3_build$data[[3]]$fill_diag, diag_cols)
})


test_that("scale_fill_tl/br/diag_gradient2 values populate properly", {
    tib <- data.frame(grp1 = c("A", "A", "A", "B", "B", "C", "A", "B"),
                      grp2 = c("B", "C", "D", "C", "D", "D", "A", "B"),
                      val_1 = c(1, 2, NA, 0, 10, 5, 5, 1),
                      val_2 = c(-2, -1, 0, 1, 2, 3, 4, 5),
                      val_3 = c(NA, NA, NA, NA, NA, NA, 1, 2))
    atib <- asymmetrise(tib, grp1, grp2)
    g1 <- ggplot(atib, aes(x = grp1, y = grp2)) +
        geom_asymmat(aes(fill_tl = val_1, fill_br = val_2, fill_diag = val_3)) +
        scale_fill_tl_gradient2(low = "lightpink", mid = "white", high = "red",
                                na.value = "green")
    g2 <- g1 +
        scale_fill_br_gradient2(low = "lightblue1",
                                mid = "grey50",
                                high = "dodgerblue")

    g3 <- g2 +
        scale_fill_diag_gradient2(low = "yellow",
                                mid = "purple",
                                high = "red")

    g1_build <- ggplot2::ggplot_build(g1)
    g2_build <- ggplot2::ggplot_build(g2)
    g3_build <- ggplot2::ggplot_build(g3)

    expect_equal(g1$scales$n(), 1)
    expect_true(g1$scales$has_scale("fill_tl"))
    expect_false(g1$scales$has_scale("fill_br"))
    expect_false(g1$scales$has_scale("fill_diag"))
    expect_equal(g2$scales$n(), 2)
    expect_true(g2$scales$has_scale("fill_tl"))
    expect_true(g2$scales$has_scale("fill_br"))
    expect_false(g2$scales$has_scale("fill_diag"))
    expect_equal(g3$scales$n(), 3)
    expect_true(g3$scales$has_scale("fill_tl"))
    expect_true(g3$scales$has_scale("fill_br"))
    expect_true(g3$scales$has_scale("fill_diag"))

    tl_cols <- c("#FFECE5", "#FFD9CB", "green",
                 "#FFFFFF", "#FF0000", "#FF9E81")
    br_cols <- c("#AAC8D3", "#95A3A8", "#7F7F7F",
                 "#7584A9", "#5F8AD3", "#1E90FF")
    diag_cols <- c("#E30081", "#FF0000", "#E30081",
                   "#FF0000", "grey50", "grey50" )


    # g1_build
    expect_equal(g1_build$data[[1]]$fill_tl, tl_cols)
    expect_true(all(is.na(g1_build$data[[1]]$fill_br)))
    expect_true(all(is.na(g1_build$data[[1]]$fill_diag)))

    expect_true(all(is.na(g1_build$data[[2]]$fill_tl)))
    expect_false(all(is.na(g1_build$data[[2]]$fill_br)))
    expect_true(all(is.na(g1_build$data[[2]]$fill_diag)))

    expect_true(all(is.na(g1_build$data[[3]]$fill_tl)))
    expect_true(all(is.na(g1_build$data[[3]]$fill_br)))
    expect_false(all(is.na(g1_build$data[[3]]$fill_diag)))

    # g2_build
    expect_equal(g2_build$data[[1]]$fill_tl, tl_cols)
    expect_true(all(is.na(g2_build$data[[1]]$fill_br)))
    expect_true(all(is.na(g2_build$data[[1]]$fill_diag)))

    expect_true(all(is.na(g2_build$data[[2]]$fill_tl)))
    expect_equal(g2_build$data[[2]]$fill_br, br_cols)
    expect_true(all(is.na(g2_build$data[[2]]$fill_diag)))

    expect_true(all(is.na(g2_build$data[[3]]$fill_tl)))
    expect_true(all(is.na(g2_build$data[[3]]$fill_br)))
    expect_false(all(is.na(g2_build$data[[3]]$fill_diag)))

    # g3_build
    expect_equal(g3_build$data[[1]]$fill_tl, tl_cols)
    expect_true(all(is.na(g3_build$data[[1]]$fill_br)))
    expect_true(all(is.na(g3_build$data[[1]]$fill_diag)))

    expect_true(all(is.na(g3_build$data[[2]]$fill_tl)))
    expect_equal(g3_build$data[[2]]$fill_br, br_cols)
    expect_true(all(is.na(g3_build$data[[2]]$fill_diag)))

    expect_true(all(is.na(g3_build$data[[3]]$fill_tl)))
    expect_true(all(is.na(g3_build$data[[3]]$fill_br)))
    expect_equal(g3_build$data[[3]]$fill_diag, diag_cols)
})


test_that("scale_fill_tl/br/diag_gradientn values populate properly", {
    tib <- data.frame(grp1 = c("A", "A", "A", "B", "B", "C", "A", "B"),
                      grp2 = c("B", "C", "D", "C", "D", "D", "A", "B"),
                      val_1 = c(1, 2, NA, 0, 10, 5, 5, 1),
                      val_2 = c(-2, -1, 0, 1, 2, 3, 4, 5),
                      val_3 = c(NA, NA, NA, NA, NA, NA, 1, 2))
    atib <- asymmetrise(tib, grp1, grp2)
    g1 <- ggplot(atib, aes(x = grp1, y = grp2)) +
        geom_asymmat(aes(fill_tl = val_1, fill_br = val_2, fill_diag = val_3)) +
        scale_fill_tl_gradientn(colours = terrain.colors(10))
    g2 <- g1 +
        scale_fill_br_gradientn(colours = heat.colors(10))

    g3 <- g2 +
        scale_fill_diag_gradientn(colours = rainbow(10))

    g1_build <- ggplot2::ggplot_build(g1)
    g2_build <- ggplot2::ggplot_build(g2)
    g3_build <- ggplot2::ggplot_build(g3)

    expect_equal(g1$scales$n(), 1)
    expect_true(g1$scales$has_scale("fill_tl"))
    expect_false(g1$scales$has_scale("fill_br"))
    expect_false(g1$scales$has_scale("fill_diag"))
    expect_equal(g2$scales$n(), 2)
    expect_true(g2$scales$has_scale("fill_tl"))
    expect_true(g2$scales$has_scale("fill_br"))
    expect_false(g2$scales$has_scale("fill_diag"))
    expect_equal(g3$scales$n(), 3)
    expect_true(g3$scales$has_scale("fill_tl"))
    expect_true(g3$scales$has_scale("fill_br"))
    expect_true(g3$scales$has_scale("fill_diag"))

    tl_cols <- c("#2AB400", "#5AC300", "grey50",
                 "#00A600", "#F2F2F2", "#E7D520")
    br_cols <- c("#FF0000", "#FF4300", "#FF8400",
                 "#FFC500", "#FFFF19", "#FFFFBF")
    diag_cols <- c("#FF0000", "#FF0099", "#FF0000",
                   "#FF0099", "grey50", "grey50")

    # g1_build
    expect_equal(g1_build$data[[1]]$fill_tl, tl_cols)
    expect_true(all(is.na(g1_build$data[[1]]$fill_br)))
    expect_true(all(is.na(g1_build$data[[1]]$fill_diag)))

    expect_true(all(is.na(g1_build$data[[2]]$fill_tl)))
    expect_false(all(is.na(g1_build$data[[2]]$fill_br)))
    expect_true(all(is.na(g1_build$data[[2]]$fill_diag)))

    expect_true(all(is.na(g1_build$data[[3]]$fill_tl)))
    expect_true(all(is.na(g1_build$data[[3]]$fill_br)))
    expect_false(all(is.na(g1_build$data[[3]]$fill_diag)))

    # g2_build
    expect_equal(g2_build$data[[1]]$fill_tl, tl_cols)
    expect_true(all(is.na(g2_build$data[[1]]$fill_br)))
    expect_true(all(is.na(g2_build$data[[1]]$fill_diag)))

    expect_true(all(is.na(g2_build$data[[2]]$fill_tl)))
    expect_equal(g2_build$data[[2]]$fill_br, br_cols)
    expect_true(all(is.na(g2_build$data[[2]]$fill_diag)))

    expect_true(all(is.na(g2_build$data[[3]]$fill_tl)))
    expect_true(all(is.na(g2_build$data[[3]]$fill_br)))
    expect_false(all(is.na(g2_build$data[[3]]$fill_diag)))

    # g3_build
    expect_equal(g3_build$data[[1]]$fill_tl, tl_cols)
    expect_true(all(is.na(g3_build$data[[1]]$fill_br)))
    expect_true(all(is.na(g3_build$data[[1]]$fill_diag)))

    expect_true(all(is.na(g3_build$data[[2]]$fill_tl)))
    expect_equal(g3_build$data[[2]]$fill_br, br_cols)
    expect_true(all(is.na(g3_build$data[[2]]$fill_diag)))

    expect_true(all(is.na(g3_build$data[[3]]$fill_tl)))
    expect_true(all(is.na(g3_build$data[[3]]$fill_br)))
    expect_equal(g3_build$data[[3]]$fill_diag, diag_cols)
})

test_that("scale_fill_tl/br/diag_distiller values populate properly", {
    tib <- data.frame(grp1 = c("A", "A", "A", "B", "B", "C", "A", "B"),
                      grp2 = c("B", "C", "D", "C", "D", "D", "A", "B"),
                      val_1 = c(1, 2, NA, 0, 10, 5, 5, 1),
                      val_2 = c(-2, -1, 0, 1, 2, 3, 4, 5),
                      val_3 = c(NA, NA, NA, NA, NA, NA, 1, 2))
    atib <- asymmetrise(tib, grp1, grp2)
    g1 <- ggplot(atib, aes(x = grp1, y = grp2)) +
        geom_asymmat(aes(fill_tl = val_1, fill_br = val_2, fill_diag = val_3)) +
        scale_fill_tl_distiller(type = "seq", palette = "Greens")
    g2 <- g1 +
        scale_fill_br_distiller(type = "div", palette = "RdYlBu")

    g3 <- g2 +
        scale_fill_diag_distiller(type = "seq", palette = "Oranges")

    g1_build <- ggplot2::ggplot_build(g1)
    g2_build <- ggplot2::ggplot_build(g2)
    g3_build <- ggplot2::ggplot_build(g3)

    expect_equal(g1$scales$n(), 1)
    expect_true(g1$scales$has_scale("fill_tl"))
    expect_false(g1$scales$has_scale("fill_br"))
    expect_false(g1$scales$has_scale("fill_diag"))
    expect_equal(g2$scales$n(), 2)
    expect_true(g2$scales$has_scale("fill_tl"))
    expect_true(g2$scales$has_scale("fill_br"))
    expect_false(g2$scales$has_scale("fill_diag"))
    expect_equal(g3$scales$n(), 3)
    expect_true(g3$scales$has_scale("fill_tl"))
    expect_true(g3$scales$has_scale("fill_br"))
    expect_true(g3$scales$has_scale("fill_diag"))

    tl_cols <- c("#16773D", "#29914A", "grey50",
                 "#005A32", "#EDF8E9", "#74C476")
    br_cols <- c("#4575B4", "#A1C9E1", "#EEF8E1",
                 "#FFECA3", "#FE9E64", "#D73027")
    diag_cols <- c("#8C2D04", "#FEEDDE", "#8C2D04",
                   "#FEEDDE", "grey50", "grey50" )

    # g1_build
    expect_equal(g1_build$data[[1]]$fill_tl, tl_cols)
    expect_true(all(is.na(g1_build$data[[1]]$fill_br)))
    expect_true(all(is.na(g1_build$data[[1]]$fill_diag)))

    expect_true(all(is.na(g1_build$data[[2]]$fill_tl)))
    expect_false(all(is.na(g1_build$data[[2]]$fill_br)))
    expect_true(all(is.na(g1_build$data[[2]]$fill_diag)))

    expect_true(all(is.na(g1_build$data[[3]]$fill_tl)))
    expect_true(all(is.na(g1_build$data[[3]]$fill_br)))
    expect_false(all(is.na(g1_build$data[[3]]$fill_diag)))

    # g2_build
    expect_equal(g2_build$data[[1]]$fill_tl, tl_cols)
    expect_true(all(is.na(g2_build$data[[1]]$fill_br)))
    expect_true(all(is.na(g2_build$data[[1]]$fill_diag)))

    expect_true(all(is.na(g2_build$data[[2]]$fill_tl)))
    expect_equal(g2_build$data[[2]]$fill_br, br_cols)
    expect_true(all(is.na(g2_build$data[[2]]$fill_diag)))

    expect_true(all(is.na(g2_build$data[[3]]$fill_tl)))
    expect_true(all(is.na(g2_build$data[[3]]$fill_br)))
    expect_false(all(is.na(g2_build$data[[3]]$fill_diag)))

    # g3_build
    expect_equal(g3_build$data[[1]]$fill_tl, tl_cols)
    expect_true(all(is.na(g3_build$data[[1]]$fill_br)))
    expect_true(all(is.na(g3_build$data[[1]]$fill_diag)))

    expect_true(all(is.na(g3_build$data[[2]]$fill_tl)))
    expect_equal(g3_build$data[[2]]$fill_br, br_cols)
    expect_true(all(is.na(g3_build$data[[2]]$fill_diag)))

    expect_true(all(is.na(g3_build$data[[3]]$fill_tl)))
    expect_true(all(is.na(g3_build$data[[3]]$fill_br)))
    expect_equal(g3_build$data[[3]]$fill_diag, diag_cols)
})

test_that("get a warning from using qual with distiller", {
    tib <- data.frame(grp1 = c("A", "A", "A", "B", "B", "C", "A", "B"),
                      grp2 = c("B", "C", "D", "C", "D", "D", "A", "B"),
                      val_1 = c(1, 2, NA, 0, 10, 5, 5, 1),
                      val_2 = c(-2, -1, 0, 1, 2, 3, 4, 5),
                      val_3 = c(NA, NA, NA, NA, NA, NA, 1, 2))
    atib <- asymmetrise(tib, grp1, grp2)
    g <- ggplot(atib, aes(x = grp1, y = grp2)) +
        geom_asymmat(aes(fill_tl = val_1, fill_br = val_2, fill_diag = val_3))

    expect_warning(g + scale_fill_tl_distiller(type = "qual", palette = 1))
    expect_warning(g + scale_fill_br_distiller(type = "qual", palette = 2))
    expect_warning(g + scale_fill_diag_distiller(type = "qual", palette = 3))
})


test_that("ggplot's midrescaler is working", {
    num_scale <- mid_rescaler(mid = 5)
    v <- c(0:10)
    sv <- seq(0, 1, 0.1)

    expect_true(is.function(mid_rescaler(mid = 10)))
    expect_true(is.function(mid_rescaler(mid = NA)))
    expect_equal(num_scale(v), sv)
    expect_error(num_scale("A"), regexp = "applied to an object of class")
    expect_true(is.null(num_scale(c())))
})


test_that("returns the correct aesthetic index", {
    fake_cs_any <- list(guide = list(available_aes = "any"))
    fake_cs_fill <- list(guide = list(available_aes = c("rand", "any", "fill")))
    fake_cs_color <- list(guide = list(available_aes = c("rand", "any", "color")))

    expect_equal(index_aesthetic(fake_cs_any, "fill"), 1)
    expect_equal(index_aesthetic(fake_cs_any, "color"), 1)
    expect_equal(index_aesthetic(fake_cs_any, "nonsense"), 1)

    expect_equal(index_aesthetic(fake_cs_fill, "fill"), 3)
    expect_equal(index_aesthetic(fake_cs_fill, "color"), integer(0))

    expect_equal(index_aesthetic(fake_cs_color, "color"), 3)
    expect_equal(index_aesthetic(fake_cs_color, "fill"), integer(0))
})
