## ---- eval=FALSE---------------------------------------------------------
#  # create a new resource group for the storage account
#  rg <- AzureRMR::az_rm$
#      new(tenant="{tenant_id}", app="{app_id}", password="{password}")$
#      get_subscription("{subscription_id}")$
#      create_resource_group("myresourcegroup", location="australiaeast")
#  
#  # create the storage account
#  stor <- rg$create_storage_account("mynewstorage")
#  stor
#  # <Azure resource Microsoft.Storage/storageAccounts/mynewstorage>
#  #   Account type: StorageV2
#  #   SKU: name=Standard_LRS, tier=Standard
#  #   Endpoints:
#  #     dfs: https://mynewstorage.dfs.core.windows.net/
#  #     web: https://mynewstorage.z26.web.core.windows.net/
#  #     blob: https://mynewstorage.blob.core.windows.net/
#  #     queue: https://mynewstorage.queue.core.windows.net/
#  #     table: https://mynewstorage.table.core.windows.net/
#  #     file: https://mynewstorage.file.core.windows.net/
#  # ---
#  #   id: /subscriptions/35975484-5360-4e67-bf76-14fcb0ab5b9d/resourceGroups/myresourcegroup/providers/Micro ...
#  #   identity: NULL
#  #   location: australiaeast
#  #   managed_by: NULL
#  #   plan: NULL
#  #   properties: list(networkAcls, supportsHttpsTrafficOnly, encryption, provisioningState, creationTime,
#  #     primaryEndpoints, primaryLocation, statusOfPrimary)
#  #   tags: list()
#  # ---
#  #   Methods:
#  #     check, delete, do_operation, get_account_sas, get_blob_endpoint, get_file_endpoint, get_tags, list_keys,
#  #     set_api_version, set_tags, sync_fields, update

## ---- eval=FALSE---------------------------------------------------------
#  stor2 <- rg$create_storage_account("myotherstorage",
#      replication="Standard_GRS",
#      access_tier="cool")

## ---- eval=FALSE---------------------------------------------------------
#  blobstor <- rg$create_storage_account("mynewblobstorage",
#      kind="blobStorage",
#      https_only=FALSE)

## ---- eval=FALSE---------------------------------------------------------
#  # retrieve one of the accounts created above
#  stor2 <- rg$get_storage_account("myotherstorage")

## ---- eval=FALSE---------------------------------------------------------
#  # delete the storage accounts created above
#  stor$delete()
#  stor2$delete()
#  blobstor$delete()
#  
#  # if you don't have a storage account object, use the resource group method:
#  rg$delete_storage_account("mynewstorage")
#  rg$delete_storage_account("myotherstorage")
#  rg$delete_storage_account("mynewblobstorage")

## ---- eval=FALSE---------------------------------------------------------
#  # create the storage account
#  rg <- AzureRMR::az_rm$
#      new(tenant="{tenant_id}", app="{app_id}", password="{password}")$
#      get_subscription("{subscription_id}")$
#      get_resource_group("myresourcegroup")
#  stor <- rg$create_storage_account("mynewstorage")
#  
#  stor$get_blob_endpoint()
#  # Azure blob storage endpoint
#  # URL: https://mynewstorage.blob.core.windows.net/
#  # Access key: <hidden>
#  # Account shared access signature: <none supplied>
#  # Storage API version: 2018-03-28
#  
#  stor$get_file_endpoint()
#  # Azure file storage endpoint
#  # URL: https://mynewstorage.file.core.windows.net/
#  # Access key: <hidden>
#  # Account shared access signature: <none supplied>
#  # Storage API version: 2018-03-28
#  
#  stor$get_adls_endpoint()
#  # Azure Data Lake Storage Gen2 endpoint
#  # URL: https://mynewstorage.dfs.core.windows.net/
#  # Access key: <hidden>
#  # Account shared access signature: <none supplied>
#  # Storage API version: 2018-03-28

## ---- eval=FALSE---------------------------------------------------------
#  # same as using the get_xxxx_endpoint() methods above
#  blob_endpoint("https://mynewstorage.blob.core.windows.net/",
#      key="mystorageaccesskey")
#  file_endpoint("https://mynewstorage.file.core.windows.net/",
#      key="mystorageaccesskey")
#  adls_endpoint("https://mynewstorage.dfs.core.windows.net/",
#      key="mystorageaccesskey")

## ---- eval=FALSE---------------------------------------------------------
#  # shared access signature: read/write access, container+object access, valid for 8 hours
#  sas <- stor$get_account_sas(permissions="rw",
#      resource_types="co",
#      start=Sys.time(),
#      end=Sys.time() + 8 * 60 * 60,
#      key=stor$list_keys()[1])
#  
#  # create an endpoint object with a SAS, but without an access key
#  blob_endp <- stor$get_blob_endpoint(key=NULL, sas=sas)

## ---- eval=FALSE---------------------------------------------------------
#  # an existing container
#  cont <- blob_container(blob_endp, "mycontainer")
#  cont
#  # Azure blob container 'mycontainer'
#  # URL: https://mynewstorage.blob.core.windows.net/mycontainer
#  # Access key: <hidden>
#  # Account shared access signature: <none supplied>
#  # Storage API version: 2018-03-28
#  
#  # create a new container and allow unauthenticated (public) access to blobs
#  newcont <- create_blob_container(blob_endp, "mynewcontainer", public_access="blob")
#  newcont
#  # Azure blob container 'mynewcontainer'
#  # URL: https://mynewstorage.blob.core.windows.net/mynewcontainer
#  # Access key: <hidden>
#  # Account shared access signature: <none supplied>
#  # Storage API version: 2018-03-28
#  
#  # delete the container
#  delete_blob_container(newcont)
#  
#  # piping also works
#  library(magrittr)
#  blob_endp %>%
#      blob_container("mycontainer")
#  # Azure blob container 'mycontainer'
#  # URL: https://mynewstorage.blob.core.windows.net/mycontainer
#  # Access key: <hidden>
#  # Account shared access signature: <none supplied>
#  # Storage API version: 2018-03-28

## ---- eval=FALSE---------------------------------------------------------
#  blob_container("https://mynewstorage.blob.core.windows.net/mycontainer",
#      key="mystorageaccountkey")
#  file_share("https://mynewstorage.file.core.windows.net/myshare",
#      key="mystorageaccountkey")
#  adls_filesystem("https://mynewstorage.dfs.core.windows.net/myshare",
#      key="mystorageaccountkey")

## ---- eval=FALSE---------------------------------------------------------
#  # list blobs inside a blob container
#  list_blobs(cont)
#  #      Name       Last-Modified Content-Length
#  # 1  fs.txt 2018-10-13 11:34:30            132
#  # 2 fs2.txt 2018-10-13 11:04:36         731930
#  
#  # if you want only the filenames
#  list_blobs(cont, info="name")
#  # [1] "fs.txt"  "fs2.txt"
#  
#  
#  # files inside a file share
#  list_azure_files(share, "/")
#  #       name type   size
#  # 1 100k.txt File 100000
#  # 2   fs.txt File    132
#  
#  
#  # and files inside an ADLS filesystem
#  list_adls_files(fs, "/")
#  #        name contentLength isDirectory                  lastModified permissions
#  # 1 blog.html         27128       FALSE Mon, 03 Dec 2018 15:20:31 GMT   rw-r-----
#  # 2    newdir             0        TRUE Thu, 29 Nov 2018 03:42:56 GMT   rwxr-x---

## ---- eval=FALSE---------------------------------------------------------
#  # upload a file to a blob container
#  blob_endp <- blob_endpoint("https://mynewstorage.blob.core.windows.net/",
#      key="mystorageaccesskey")
#  cont <- blob_container(blob_endp, "mycontainer")
#  upload_blob(cont, src="myfile", dest="myblob")
#  
#  # again, piping works
#  blob_endpoint("https://mynewstorage.blob.core.windows.net/", key="mystorageaccesskey") %>%
#      blob_container("mycontainer") %>%
#      upload_blob("myfile", "myblob")
#  
#  # download a blob, overwriting any existing destination file
#  download_blob(cont, "myblob", "myfile", overwrite=TRUE)
#  
#  # as a convenience, you can transfer files directly to and from an Azure URL
#  download_from_url("https://mynewstorage.blob.core.windows.net/mycontainer/myblob",
#      "myfile",
#      key="mystorageaccesskey",
#      overwrite=TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  list_azure_files(share, "/")
#  #       name type   size
#  # 1 100k.txt File 100000
#  # 2   fs.txt File    132
#  
#  # create a directory under the root of the file share
#  create_azure_dir(share, "newdir")
#  
#  # confirm that the directory has been created
#  list_azure_files(share, "/")
#  #       name      type   size
#  # 1 100k.txt      File 100000
#  # 2   fs.txt      File    132
#  # 3   newdir Directory     NA
#  
#  # delete the directory
#  delete_azure_dir(share, "newdir")

