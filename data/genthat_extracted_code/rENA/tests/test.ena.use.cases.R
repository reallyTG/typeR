# suppressMessages(library(rENA, quietly = T, verbose = F))
# context("Test Use Cases");
#
# # codeNames = c("Tradeoffs", "Performance.Parameters", "Constraints.and.Requests", "Collaboration", "Data");
# codeNames = c('Data','Technical.Constraints','Performance.Parameters','Client.and.Consultant.Requests','Design.Reasoning'); #,'Collaboration');
#
#
# test_that("Case 1: Group Plotting 1", {
#   fileName = system.file("extdata","rs.data.csv", package = "rENA")
#   file = read.csv(fileName);
#   accum = ena.accumulate.data(
#     units = file[,c("UserName","Condition")],
#     conversation = file[,c("Condition","GroupName")],
#     metadata = file[,c("CONFIDENCE.Change","CONFIDENCE.Pre","CONFIDENCE.Post","C.Change")],
#     codes = file[,codeNames],
#     window.size.back = 4
#   );
#   set = ena.make.set(
#     enadata = accum,
#     rotation.by = ena.rotate.by.mean,
#     rotation.params = list(accum$metadata$Condition=="FirstGame", accum$metadata$Condition=="SecondGame")
#   )
#   unitNames = set$enadata$units
#
#     ### Subset rotated points and plot Condition 1 Group Mean
#     first.game = unitNames$Condition == "FirstGame"
#     first.game.points = set$points.rotated[first.game,]
#
#     ### Subset rotated points and plot Condition 2 Group Mean
#     second.game = unitNames$Condition == "SecondGame"
#     second.game.points = set$points.rotated[second.game,]
#
#     first.game.mean = colMeans( first.game.points )
#     second.game.mean = colMeans( second.game.points )
#
#     first.game.ci = t.test(first.game.points, conf.level = 0.95)$conf.int
#     second.game.ci = t.test(second.game.points, conf.level = 0.95)$conf.int
#
#   ### GROUP PLOTTING VERSION 1
#     plot = ena.plot(set) %>%
#       ena.plot.points(
#         first.game.mean, labels="FirstGame", colors = "red", shape="square", confidence.interval.values=first.game.ci, confidence.interval = "crosshair") %>%
#       ena.plot.points(second.game.mean, labels = "SecondGame", colors  = "blue", shape="square", confidence.interval.values=second.game.ci, confidence.interval = "crosshair");
#
#     testthat::expect_is(plot, c("ENAplot", "R6"));
#
#   ### GROUP PLOTTING VERSION 2
#     plot2 = ena.plot(set) %>%
#      ena.plot.group(first.game.points, labels = "FirstGame", colors = "red", confidence.interval = "crosshair") %>%
#      ena.plot.group(second.game.points, labels = "SecondGame", colors  = "blue", confidence.interval = "crosshair");
#
#     testthat::expect_is(plot2, c("ENAplot", "R6"));
#   ### END V2
#
#    ### Subset edge weights and plot Condition 1 Mean Network
#    first.game.lineweights = set$line.weights[first.game,]
#    first.game.mean = colMeans(first.game.lineweights)
#    plot.network.1 = ena.plot(set) %>% ena.plot.network(network = first.game.mean)
#
#    ### Subset edge weights and plot Condition 2 Mean Network
#    second.game.lineweights = set$line.weights[second.game,]
#    second.game.mean = colMeans(second.game.lineweights)
#    plot.network.2 = ena.plot(set) %>% ena.plot.network(network = second.game.mean, colors = c("blue"))
#
#    ### Subset Plot subtracted mean networks
#    subtracted.network = first.game.mean - second.game.mean
#    plot.network.sub = ena.plot(set) %>% ena.plot.network(network = subtracted.network)
#
#   testthat::expect_is(plot, c("ENAplot", "R6"));
# })
#
# test_that("Case 2: Individual Plotting", {
#   fileName = system.file("extdata","rs.data.csv", package = "rENA")
#   file = read.csv(fileName);
#   accum = ena.accumulate.data(
#     units = file[,c("UserName","Condition")],
#     conversation = file[,c("Condition","GroupName")],
#     metadata = file[,c("CONFIDENCE.Change","CONFIDENCE.Pre","CONFIDENCE.Post","C.Change")],
#     codes = file[,codeNames],
#     window.size.back = 4
#   );
#   set = ena.make.set(
#     enadata = accum,
#     rotation.by = ena.rotate.by.mean,
#     rotation.params = list(accum$metadata$Condition=="FirstGame", accum$metadata$Condition=="SecondGame")
#   )
#   unitNames = set$enadata$units
#
#   first.game = unitNames$Condition == "FirstGame"
#   first.game.points = set$points.rotated[first.game,]
#   plot.firstgame.points = ena.plot(set) %>% ena.plot.points(points = first.game.points)
#
#   user.akashv.rows = set$enadata$units$UserName == "akash v"
#   user.akashv = set$line.weights[user.akashv.rows,]
#   user.akashv.network = ena.plot(set) %>% ena.plot.network(network = user.akashv)
#
#   testthat::expect_is(user.akashv.network, c("ENAplot", "R6"));
# })
#
# test_that("Case 3: Group Plotting 2", {
#   fileName = system.file("extdata","rs.data.csv", package = "rENA")
#   file = read.csv(fileName);
#   accum = ena.accumulate.data(
#     units = file[,c("UserName","Condition")],
#     conversation = file[,c("Condition","GroupName")],
#     metadata = file[,c("CONFIDENCE.Change","CONFIDENCE.Pre","CONFIDENCE.Post","C.Change")],
#     codes = file[,codeNames],
#     window.size.back = 4
#   );
#   set = ena.make.set(
#     enadata = accum,
#     rotation.by = ena.rotate.by.mean,
#     rotation.params = list(accum$metadata$Condition=="FirstGame", accum$metadata$Condition=="SecondGame")
#   )
#   unitNames = set$enadata$units
#   groups = ena.group(set, by=set$enadata$metadata$C.Change, method="mean")
#
#   ####OR TRY THIS WAY####
#   groups.2 = ena.group(set, by=set$enadata$metadata$C.Change=="Pos.Change", method="mean") #Test to make sure this returns only 1 group
#
#   plot.confidence.change = ena.plot(set) %>%
#                             ena.plot.points(points = groups$points[groups$names=="Pos.Change",], labels = "Positive Confidence Change", shape = "square", colors="red")%>%
#                             ena.plot.points(points = groups$points[groups$names=="Neg.Change",], labels = "Negative Confidence Change", shape = "square", colors="blue")
#
#   # testthat::expect_is(plot, c("ENAplot", "R6"))
# })
#
# test_that("Case 4: Stats", {
#   fileName = system.file("extdata","rs.data.csv", package = "rENA")
#   file = read.csv(fileName);
#   accum = ena.accumulate.data(
#     units = file[,c("UserName","Condition")],
#     conversation = file[,c("Condition","GroupName")],
#     metadata = file[,c("CONFIDENCE.Change","CONFIDENCE.Pre","CONFIDENCE.Post","C.Change")],
#     codes = file[,codeNames],
#     window.size.back = 4
#   );
#   set = ena.make.set(
#     enadata = accum,
#     rotation.by = ena.rotate.by.mean,
#     rotation.params = list(accum$metadata$Condition=="FirstGame", accum$metadata$Condition=="SecondGame")
#   )
#   unitNames = set$enadata$units
#   unitNames = set$enadata$units
#   first.game = unitNames$Condition == "FirstGame"
#   first.game.points = set$points.rotated[first.game,]
#   second.game = unitNames$Condition == "SecondGame"
#   second.game.points = set$points.rotated[second.game,]
#
#   t.test(first.game.points[,1], second.game.points[,1])
#
#   data = data.frame("conf.change"=set$enadata$metadata$CONFIDENCE.Change, dim1 = set$points.rotated[,1])
#
#   # lm(conf.change ~ dim1, data)
# })
#
# test_that("Case 5: Code Masking", {
#   fileName = system.file("extdata","rs.data.csv", package = "rENA")
#   file = read.csv(fileName);
#   accum = ena.accumulate.data(
#     units = file[,c("UserName","Condition")],
#     conversation = file[,c("Condition","GroupName")],
#     metadata = file[,c("CONFIDENCE.Change","CONFIDENCE.Pre","CONFIDENCE.Post","C.Change")],
#     codes = file[,codeNames],
#     window.size.back = 4
#   );
#   set = ena.make.set(
#     enadata = accum,
#     rotation.by = ena.rotate.by.mean,
#     rotation.params = list(accum$metadata$Condition=="FirstGame", accum$metadata$Condition=="SecondGame")
#   )
#   unitNames = set$enadata$units
#   ### generate mask matrix
#   mask = matrix(1, nrow=length(set$codes), ncol=length(set$codes), dimnames=list(set$codes,set$codes))
#   mask["Data", "Client.and.Consultant.Requests"] = 0
#   mask["Technical.Constraints", "Design.Reasoning"] = 0
#
#   ###accumulate data using mask
#   accum = ena.accumulate.data(
#     units = file[,c("UserName","Condition")],
#     conversation = file[,c("Condition","GroupName")],
#     codes = file[,codeNames],
#     window.size.back = 4,
#     mask = mask
#   );
#
#   testthat::expect_true(all(accum$adjacency.vectors[,4] == 0))
#   testthat::expect_true(all(accum$adjacency.vectors[,8] == 0))
# })
#
# test_that("Case 6: Other Rotation Functions", {
#   fileName = system.file("extdata","rs.data.csv", package = "rENA")
#   file = read.csv(fileName);
#   accum = ena.accumulate.data(
#     units = file[,c("UserName","Condition")],
#     conversation = file[,c("Condition","GroupName")],
#     metadata = file[,c("CONFIDENCE.Change","CONFIDENCE.Pre","CONFIDENCE.Post","C.Change")],
#     codes = file[,codeNames],
#     window.size.back = 4
#   );
#   set = ena.make.set(
#     enadata = accum,
#     rotation.by = ena.rotate.by.mean,
#     rotation.params = list(accum$metadata$Condition=="FirstGame", accum$metadata$Condition=="SecondGame")
#   )
#   unitNames = set$enadata$units
#
#   set.new = ena.make.set(
#     accum,
#     rotation.by = "ena.svd",
#     rotation.params = NULL
#   );
#
#   testthat::expect_false(identical(set.new$points.rotated, set$points.rotated))
# })
#
# test_that("Case 7: Trajectories", {
#   fileName = system.file("extdata","rs.data.csv", package = "rENA")
#   file = read.csv(fileName);
#   accum = ena.accumulate.data(
#     units = file[,c("UserName","Condition")],
#     conversation = file[,c("Condition","GroupName")],
#     metadata = file[,c("CONFIDENCE.Change","CONFIDENCE.Pre","CONFIDENCE.Post","C.Change")],
#     codes = file[,codeNames],
#     window.size.back = 4
#   );
#   set = ena.make.set(
#     enadata = accum,
#     rotation.by = ena.rotate.by.mean,
#     rotation.params = list(accum$metadata$Condition=="FirstGame", accum$metadata$Condition=="SecondGame")
#   )
#   unitNames = set$enadata$units
#   accum = ena.accumulate.data(
#     units = file[,c("UserName","Condition")],
#     conversation = file[,c("Condition","GroupName","ActivityNumber")],
#     codes = file[,codeNames],
#     model = "AccumulatedTrajectory",
#     window.size.back = 4
#   );
#
#   set = ena.make.set(accum,
#          rotation.by = ena.rotate.by.mean,
#          rotation.params = list(accum$metadata$Condition=="FirstGame", accum$metadata$Condition=="SecondGame"));
#
#   user.akashv.rows = which(set$enadata$units$UserName == "akash v")
#   user.akashv.points = set$points.rotated[user.akashv.rows,]
#
#   plot = ena.plot(set)
#   plot = ena.plot.trajectory(plot, points = user.akashv.points)
#
#   first.game.rows = set$enadata$trajectories$units$Condition == "FirstGame"
#   first.game.points = set$points.rotated[first.game.rows, ]
#   first.game.steps = set$enadata$trajectories$step$ActivityNumber[first.game.rows]
#   first.game.means = aggregate(first.game.points, by = list(first.game.steps), FUN = "mean")
#
#   # plot = ena.plot.trajectory(plot, set$rotated.points[first.game.points,], by = set$enadata$units$UserName[first.game.rows], shape = "circle")
#
#   plot = ena.plot.trajectory(plot, first.game.means, shape = "square")
#
#   first.game.units = set$enadata$trajectories$units$UserName[first.game.rows]
#
#   # plot = ena.plot.trajectory(plot, set$points.rotated, by = list(first.game.units), shape = "circle")
# })
#
# test_that("Case 8: Bidirectional ENA", {
#
#   # ::::::::::::::::::::::: #
#   # :::::: functions :::::: #
#   # ::::::::::::::::::::::: #
#
#   # window.to.ord = function(g, u)
#   # {
#   #   codes = colnames(u)
#   #   n.codes = length(codes)
#   #
#   #   g = colSums(g)
#   #
#   #   out = matrix(nrow=0, ncol=2*n.codes)
#   #   colnames(out) = LETTERS[1:ncol(out)]
#   #   colnames(out)[1:n.codes] = apply(rbind(codes,"s"),2,paste,collapse=".")
#   #   colnames(out)[(n.codes+1):ncol(out)] = apply(rbind(codes,"r"),2,paste,collapse=".")
#   #
#   #   key = rbind(c(colnames(u),colnames(u)),
#   #               c(rep("s",ncol(u)),rep("r",ncol(u))))
#   #
#   #   # do u first
#   #   if(sum(u)>1)
#   #   {
#   #     for(n in which(u==1))
#   #     {
#   #       for(m in which(u==1))
#   #       {
#   #         if(m!=n)
#   #         {
#   #           out = rbind(out, 0)
#   #           out[nrow(out), key[1,]==codes[n]&key[2,]=="s"] = 1
#   #           out[nrow(out), key[1,]==codes[m]&key[2,]=="r"] = 1
#   #         }
#   #       }
#   #     }
#   #   }
#   #
#   #   for(n in which(u==1))
#   #   {
#   #     for(m in which(g==1))
#   #     {
#   #       out = rbind(out, 0)
#   #       out[nrow(out), key[1,]==codes[n]&key[2,]=="s"] = 1
#   #       out[nrow(out), key[1,]==codes[m]&key[2,]=="r"] = 1
#   #     }
#   #   }
#   #   return(out)
#   # }
#   #
#   # # :::::::::::::::::::: #
#   # # :::::: script :::::: #
#   # # :::::::::::::::::::: #
#   #
#   # dataFilePath = fileName
#   # outputPath = '../output/RSdata1.ordered.csv'
#   # x = read.csv(dataFilePath, stringsAsFactors = F)
#   #
#   # codes = c("Tradeoffs",
#   #           "Performance.Parameters",
#   #           "Constraints.and.Requests",
#   #           "Collaboration",
#   #           "Data")
#   # n.codes = length(codes)
#   #
#   # meta.names = c('UserName', 'Condition')
#   # temporal.names = c('ActivityNumber')
#   # all.meta.names = c(meta.names, temporal.names)
#   #
#   # window.size = 4
#   #
#   # # initialize new data for later accumulation in web tool
#   # out = matrix(nrow=0, ncol=2*n.codes, dimnames=list(NULL, c(codes, codes)))
#   # for(n in 1:n.codes)
#   #   colnames(out)[n] = paste(c(colnames(out)[n],"s"),collapse='.')
#   # for(n in (n.codes+1):ncol(out))
#   #   colnames(out)[n] = paste(c(colnames(out)[n],"r"),collapse='.')
#   #
#   # out.meta = matrix(nrow=0, ncol=2,
#   #                   dimnames=list(NULL,
#   #                                 meta.names))
#   # out.other = matrix(nrow = 0,
#   #                    ncol = length(setdiff(colnames(x),codes)),
#   #                    dimnames = list(NULL, setdiff(colnames(x),codes)))
#   #
#   # if (length(meta.names)>1)
#   #   m = apply(x[, meta.names], 1, paste, collapse='.')
#   # else
#   #   m = x[, meta.names]
#   #
#   # if (length(temporal.names)>1)
#   #   e = apply(x[, temporal.names], 1, paste, collapse='.')
#   # else
#   #   e = x[, temporal.names]
#   #
#   # # subset lines for unit
#   # for(unit in unique(m))
#   # {
#   #   x1 = x[m == unit, ]
#   #   m1 = m[m == unit]
#   #
#   #   # subset lines for day
#   #   for(tmprl in unique(e))
#   #   {
#   #     x2 = x1[ e == tmprl, ]
#   #     m2 = m1[ e == tmprl, ]
#   #
#   #     if(!nrow(x2)) next
#   #
#   #     # pull window
#   #     for(n in 1:nrow(x2))
#   #     {
#   #       # current utterance
#   #       u = x2[n, codes]
#   #
#   #       # determine how many utterances to pull for (upper) window
#   #       if(n == 1) g = matrix(0, nrow = 1, ncol = n.codes, dimnames = list(NULL, codes))
#   #       if(n > 1 & n < window.size - 1) g = x2[1:(n-1), codes]
#   #       if(n >= window.size)  g = x2[(n - window.size):(n - 1), codes]
#   #
#   #       new.lines = window.to.ord(g, u)
#   #       out = rbind(out, new.lines)
#   #
#   #       if(nrow(new.lines)>0)
#   #       {
#   #         for(i in 1:nrow(new.lines))
#   #         {
#   #           out.meta = rbind(out.meta, x2[n, all.meta.names])
#   #           # grab all other columns too
#   #           other.col.names = setdiff(names(x), all.meta.names)
#   #           other.col.names = setdiff(other.col.names, codes)
#   #           out.other = rbind(out.other, x2[n, other.col.names])
#   #         }
#   #       }
#   #     }
#   #   }
#   # }
#   #
#   # out = cbind(out.other,out)
#   #
#   # write.csv(out, outputPath, row.names=F)
#   #
#   #
#   # # :::::::::::::::::::::::: #
#   # # :::::: accumulate :::::: #
#   # # :::::::::::::::::::::::: #
#   # file = read.csv(outputPath)
#   # accum = ena.accumulate.data.file(
#   #   units = file[,c("UserName","Condition")],
#   #   conversation = file[,c("Condition","GroupName")],
#   #   codes = file[,codeNames],
#   #   window.size.back = 3
#   # );
#
# })
#
# test_that("Case 9: Expected Value ENA", {
#   # accum = ena.accumulate.data(
#   #   units = file[,c("UserName","Condition")],
#   #   conversation = file[,c("Condition","GroupName")],
#   #   codes = file[,codeNames],
#   #   window.size.back = 4
#   # );
#   #
#   # set = ena.make.set(accum,
#   #                    rotation.by = ena.rotate.by.mean,
#   #                    rotation.params = c("Condition", c("FirstGame", "SecondGame")))
#   #
#   # code.names = accum$codes
#   # units.by = accum$unit.names
#   #
#   # # gather original coded lines of data and their metadata
#   # orig.data = accum$raw[,code.names]
#   # orig.meta = accum$raw[, units.by]
#   # if (class(orig.meta) %in% c('character', 'numeric', 'factor'))
#   #   orig.meta = data.frame(matrix(orig.meta, ncol=1, dimnames=list(NULL, units.by)))
#   #
#   # # gather units' connection strengths and their metadata
#   # meta = set$metadata
#   # if (class(meta) %in% c('character', 'numeric', 'factor'))
#   #   meta = data.frame(matrix(meta, ncol=1, dimnames=list(NULL, names(set$meta)[1])))
#   # data = set$line.weights
#   #
#   # # for each unit
#   # for (i in 1:nrow(meta))
#   # {
#   #   # find rows of orig.data belonging to unit 'i'
#   #   bool <- rep(T, nrow(orig.data))
#   #   for (j in 1:ncol(meta))
#   #   {
#   #     colname = names(meta)[j]
#   #     bool <- bool & (orig.meta[, colname] == meta[i, j])
#   #   }
#   #
#   #   # compute base rates and expected connection strengths
#   #   base.rates = colMeans(orig.data[bool, ])
#   #   combos = which(upper.tri(diag(length(code.names))), arr.ind=T)
#   #   expected.values = base.rates[combos[, 1]] * base.rates[combos[, 2]]
#   #
#   #   # subtract expected values from connection strengths
#   #   data[i, ] = data[i, ] - expected.values
#   # }
#   #
#   # # negative numbers were introduced so we need to remap
#   # data = (data + 1)/2
#   #
#   # # write it back to the ENA set
#   # for (i in 1:nrow(data))
#   # {
#   #   for (j in 1:ncol(data))
#   #   {
#   #     set$line.weights[i, j] = data[i, j]
#   #   }
#   # }
# })
